angular.module('defsynthApp', [
  'ui.router'
  'mgcrea.ngStrap'
  'defsynthPartials'
])
  .config ($stateProvider, $urlRouterProvider, $locationProvider, $sceProvider) ->
    # disable sce
    # TODO: FIX
    $sceProvider.enabled(false)

    # push-state routes
    $locationProvider.html5Mode(true)

    # default to 404 if state not found
    $urlRouterProvider.otherwise('/404')

    $stateProvider
      .state 'index',
        url: '/'
        templateUrl: 'index.html'

      .state '404',
        url: '/404'
        templateUrl: '404.html'

      .state 'style-guide',
        url: '/style-guide'
        templateUrl: 'style-guide.html'
        controller: 'StyleGuideCtrl'
