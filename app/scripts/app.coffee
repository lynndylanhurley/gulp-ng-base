angular.module('defsynthApp', [
  'ngSanitize'
  'ngResource'
  'ui.router'
  'mgcrea.ngStrap'
  'angularSpinner'
  'defsynthPartials'
  #'newark'
])
  .config ($stateProvider, $urlRouterProvider, $locationProvider, $sceProvider, $httpProvider) ->
    # disable sce
    # TODO: FIX
    $sceProvider.enabled(false)

    # push-state routes
    $locationProvider.html5Mode(true)

    # default to 404 if state not found
    $urlRouterProvider.otherwise('/404')

    # include underscore string methods
    _.mixin(_.str.exports())

    $httpProvider.defaults.useXDomain = true

    $stateProvider
      .state 'index',
        url: '/'
        templateUrl: 'index.html'
        controller: 'IndexCtrl'

      .state '404',
        url: '/404'
        templateUrl: '404.html'

      .state 'style-guide',
        url: '/style-guide'
        templateUrl: 'style-guide.html'
        controller: 'StyleGuideCtrl'

      .state 'terms',
        url: '/terms'
        templateUrl: 'terms.html'

      .state 'parts',
        url: '/parts'
        templateUrl: 'parts.html'
        controller: 'PartsCtrl'

      .state 'api-demo',
        url: '/api-demo'
        templateUrl: 'api-demo.html'
        controller: 'ApiDemoCtrl'
