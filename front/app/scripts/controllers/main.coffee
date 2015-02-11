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
    $scope.items = JSON.parse localStorage.getItem 'dummy_response'
    # (Api.getIllustrators 'dummy').then (res) -> 
    #   $scope.items = res.data
    #   localStorage.setItem 'dummy_response', JSON.stringify res.data
    #   console.log res.data
  ]
