angular.module('defsynthApp')
  .controller 'StyleGuideCtrl', ($scope) ->
    console.log 'bang, style guide'

    $scope.modal =
      title: 'Title'
      content: 'Modal Content'

    $scope.fakeListContent = _.map [0...3], ->
      Faker.Lorem.sentences(1)

    $scope.fakeUsers = _.map [0...6], ->
      firstName: Faker.Name.firstName()
      lastName:  Faker.Name.lastName()
      email:     Faker.Internet.email()

    console.log 'fake sentences', $scope.fakeListContent
