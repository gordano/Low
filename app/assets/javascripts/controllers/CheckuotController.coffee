angular.module("receta").controller("CheckuotController",
  [ '$scope','$routeParams', '$location', '$resource','$cookies','$cookieStore','myCart'
  ($scope,$routeParams,$location,$resource,$cookies, $cookieStore, myCart)->
    $scope.orderStatusOk = false
    $scope.user = {}
    $scope.go = (path)->
      $location.path(path)
    myCart.init('products')
    $scope.orderProducts = myCart.listItems()
    $scope.orderProducts = undefined if _.size($scope.orderProducts) == 0
    $scope.orderTotalPrice = myCart.priceTotal($scope.orderProducts)


    $scope.orderSubmit = ->
      jsonOrder = {
        userInfo: $scope.user,
        productsInfo: $scope.orderProducts
      }
      jsonRedy = angular.toJson(jsonOrder,'products')
      jsonSent = $resource('/orders', { jsonOrder })
      jsonSent.save((results)->
        if results['$resolved']
          $scope.orderStatusOk = true
          myCart.clearList()
        )
  ])
