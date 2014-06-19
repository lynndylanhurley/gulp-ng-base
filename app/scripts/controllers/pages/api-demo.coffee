angular.module('defsynthApp')
  .controller 'ApiDemoCtrl', ($scope, $resource) ->
    console.log 'api demo ctrl'

    synthResource = $resource('http://127.0.0.1:3000/synth_modules/:id', null, {
      'update': { method: 'PUT' }
    })


    componentResource = $resource('http://127.0.0.1:3000/components/:id', null, {
      'update': { method: 'PUT' }
    })


    $scope.getSynthModules = ->
      synthResource.get().$promise.then((resp) -> console.log 'get resp', resp)

    $scope.getComponents = ->
      componentResource.get().$promise.then((resp) -> console.log 'get resp', resp)

    $scope.postSynthModule = ->
      console.log 'posting synth module'
      synthResource.save({
        name: 'test from client'
        url: 'http://defsynth.org'
        description: 'bang'
        components: [
          {quantity: 1, component_id: 2}
          {quantity: 2, component_id: 3}
        ]
      })
        .$promise
        .then((resp) ->
          console.log 'component post success resp', resp
        )

      false


    $scope.postComponent = ->
      console.log 'posting component'

      componentResource.save({
        name: 'test from client'
        mpn: 'xyz'
        newarkSKU: '123'
      })
        .$promise
        .then((resp) ->
          console.log 'component post success resp', resp
        )

      false
