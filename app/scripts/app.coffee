console.log 'bang xxx'

angular.module('defsynthApp', [
  'ui.router'
  'defsynthPartials'
])
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    # push-state routes
    $locationProvider.html5Mode(true)

    # default to 404 if state not found
    $urlRouterProvider.otherwise('/404')

    $stateProvider
      .state 'index',
        url: '/',
        templateUrl: 'index.html'

      .state '404',
        url: '/404',
        templateUrl: '404.html'
