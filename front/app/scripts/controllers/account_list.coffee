'use strict'

###*
 # @ngdoc function
 # @name frontApp.controller:AccountListCtrl
 # @description
 # # AccountListCtrl
 # Controller of the frontApp
###
angular.module('frontApp')
  .controller 'AccountListCtrl', ["$scope", "Api", "Const", ($scope, Api, Const) -> 
    $scope.full_items = JSON.parse localStorage.getItem 'dummy_response'
    $scope.current_size = Math.min Const.AccountList.page_size, $scope.full_items.length
    $scope.items = $scope.full_items.slice 0, $scope.current_size
    # (Api.getIllustrators 'dummy').then (res) -> 
    #   $scope.items = res.data
    #   localStorage.setItem 'dummy_response', JSON.stringify res.data
    #   console.log res.data

    $scope.loadMore = ->
      next_size = Math.min $scope.current_size + Const.AccountList.page_size, $scope.full_items.length
      new_items =  $scope.full_items.slice $scope.current_size, next_size
      $scope.items.push new_item for new_item in new_items
      $scope.current_size = next_size
  ]
