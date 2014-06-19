angular.module('newark', ['LocalStorageModule', 'components'])
  .service '$newark', ($q, $http, $timeout, localStorageService) ->
    siteUrl:    'http://www.newark.com'
    apiUrl:     'http://api.element14.com//catalog/products'
    $body:      $('body')
    sessionReq: null

    addToCart: (parts) ->
      # look up part info on each part
      dfds = _.map parts, (part, idx) =>
        console.log 'looking for item', part.mpn
        @getItemUrl(part.mpn)

      # wait until all part lookups are complete
      $q.all(dfds).then((items) =>
        # map each item to its target quantity
        _.each(items, (item, idx) ->
          item.quantity = parts[idx].quantity
        )

        # make sure we have a cookie set on newark.com
        @createSession(items[0]).then =>

          # add all items to cart
          # NOTE: this will always appear to fail (xss)
          @batchAddItems(items)
            .success((resp) =>
              console.log 'batch add success', resp
            )
            .error((resp) =>
              console.log 'batch add error', arguments
            )
      )

    # make sure we have the correct cookies from newark
    createSession: (item) ->
      unless @sessionReq
        @sessionReq = $q.defer()

        $http({
          url: item.skuUrl
          method:       'JSONP'
          params:
            callback: 'JSON_CALLBACK'
        })
          .success((resp) =>
            console.log 'sku success'
            @sessionReq.resolve()
          )
          .error((resp) =>
            console.log 'sku error'
            @sessionReq.resolve()
          )

      @sessionReq.promise


    batchAddItems: (items) ->
      $http(@buildBatchCartAddArgs(items))


    buildSearchQueryArgs: (mpn) ->
      url: @apiUrl
      method: 'JSONP'
      params:
        term:                            "manuPartNum:#{mpn}"
        "callInfo.callback":             'JSON_CALLBACK'
        "callInfo.responseDataFormat":   "JSON"
        "callInfo.apiKey":               CONFIG.NEWARK_KEY
        "storeInfo.id":                  "www.newark.com"
        "resultsSettings.responseGroup": 'large'


    buildBatchCartAddArgs: (items) ->
      console.log 'batch add form', items
      out =
        url: 'https://www.newark.com/webapp/wcs/stores/servlet/ProcessBasket'
        method: 'JSONP'
        params:
          langId:         -1
          catalogId:      15003
          itemsArray:     []
          BASE_URL:       'BasketPage'
          errorViewName:  'AjaxOrderItemDisplayView'
          URL:            'BasketDataAjaxResponse'
          partNumber_Add: _.map(items, (item) -> item.sku)
          quantity_Add:   _.map(items, (item) -> item.quantity)

      return out


    # NOTE: this won't work. must first find orderId for each item.
    buildCartUpdateArgs: (items) ->
      out =
        url: 'https://www.newark.com/webapp/wcs/stores/servlet/ProcessBasket'
        method: 'JSONP'
        params:
          langId:          -1
          BASE_URL:        'BasketPage'
          errorViewName:   'AjaxOrderItemDisplayView'
          URL:             'BasketDataAjaxResponse'

      _.each(items, (item, idx) ->
        out["orderItemId_#{idx+1}"] = item.orderId
        out["quantity_#{idx+1}"] = item.quantity
      )

      return out


    # ad a single item to cart
    buildAddCartArgs: (item, quantity=1) ->
      url:          item.cartUrl
      method:       'JSONP'
      params:
        catalogId:    15003
        langId:       -1
        quantity_1:   quantity
        storeId:      10194
        partNumber_1: item.sku
        callback:     'JSON_CALLBACK'


    # get newark product info on item by manufacturer part number
    # cache the response in local storage for future use
    getItemUrl: (mpn) ->
      dfd = $q.defer()

      if localStorageService.get(mpn)
        dfd.resolve(localStorageService.get(mpn))
      else
        $http(@buildSearchQueryArgs(mpn))
          .success((resp) =>

            part = resp
              .manufacturerPartNumberSearchReturn
              .products[0]

            baseUrl = @siteUrl + '/' +
              _(part.displayName.split(' - '))
                .map((item) -> _.slugify(item))
                .value()
                .join('/') + '/dp/'

            _.extend part,
              baseUrl:    baseUrl
              cartUrl:    baseUrl + 'AjaxOrderItemAdd'
              skuUrl:     baseUrl + part.sku
              partNumber: mpn

            localStorageService.set(mpn, part)

            dfd.resolve(localStorageService.get(mpn))
          )
          .error((resp) ->
            dfd.reject()
          )

      dfd.promise
