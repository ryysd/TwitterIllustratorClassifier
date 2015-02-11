'use strict'

###*
 # @ngdoc function
 # @name frontApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the frontApp
###
angular.module('frontApp')
  .controller 'MainCtrl', ["$scope", "Api", ($scope, Api) -> 
    (Api.getIllustrators 'dummy').then (res) -> 
      $scope.results = res.data
      console.log res.data
  ]
