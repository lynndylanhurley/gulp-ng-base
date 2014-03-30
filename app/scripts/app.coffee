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
        url: '/'
        templateUrl: 'index.html'

      .state '404',
        url: '/404'
        templateUrl: '404.html'

      .state 'style-guide',
        url: '/style-guide'
        templateUrl: 'style-guide.html'
        controller: ($scope) ->
          $scope.fakeListContent = _.map [0...3], ->
            Faker.Lorem.sentences(1)

          $scope.fakeUsers = _.map [0...6], ->
            firstName: Faker.Name.firstName()
            lastName:  Faker.Name.lastName()
            email:     Faker.Internet.email()

          console.log 'fake sentences', $scope.fakeListContent
