angular.module('defsynthApp')
  .controller 'PartsCtrl', ($scope, $newark) ->
    console.log 'newark', $newark

    # example sku numbers
    # 26M0474
    # 12T8201
    # 05M1847

    $newark.addToCart([{
      mpn: 'LT300014T261K0J'
      quantity: 2
    }, {
      mpn: 'OHB65J6'
      quantity: 3
    }, {
      mpn: 'WP2S-R82JA25'
      quantity: 4
    }])
