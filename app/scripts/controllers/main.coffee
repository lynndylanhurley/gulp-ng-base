angular.module('defsynthApp')
  .controller 'MainCtrl', ($rootScope, $location, $state, $stateParams) ->
    $body = $('body')

    # page change events
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      # tracking
      ga('send', 'pageview', {'page': $location.path()})

      # set body class to state name
      $body.attr 'class', toState.name.replace(/\./g, ' ')

    refresh = ->
      $state.transitionTo($state.current, $stateParams, {
        reload: true
        inherit: false
        notify: true
      })
