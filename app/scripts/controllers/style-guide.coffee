angular.module('defsynthApp')
  .controller 'StyleGuideCtrl', ($scope) ->
    console.log 'bang, style guide'

    $scope.modal =
      title:   Faker.Lorem.sentence(4)
      content: Faker.Lorem.paragraph(1)

    $scope.aside =
      title:   Faker.Lorem.sentence(4)
      content: Faker.Lorem.sentence(4)

    $scope.alert =
      title:   Faker.Lorem.sentence(4)
      content: Faker.Lorem.sentence(10)
      type:    'info'

    $scope.buttons =
      toggle: false
      checkbox:
        left:   false
        middle: false
        right:  false
      radio: 2

    $scope.selectedIcon = ''
    $scope.selectedIcons = []
    $scope.icons = [
      {value: 'Gear', label: '<i class="fa fa-gear"></i> Gear'}
      {value: 'Globe', label: '<i class="fa fa-globe"></i> Globe'}
      {value: 'Heart', label: '<i class="fa fa-heart"></i> Heart'}
      {value: 'Camera', label: '<i class="fa fa-camera"></i> Camera'}
    ]

    $scope.fakeListContent = _.map [0...3], ->
      Faker.Lorem.sentences(1)

    $scope.fakeUsers = _.map [0...6], ->
      firstName: Faker.Name.firstName()
      lastName:  Faker.Name.lastName()
      email:     Faker.Internet.email()

    console.log 'fake sentences', $scope.fakeListContent
