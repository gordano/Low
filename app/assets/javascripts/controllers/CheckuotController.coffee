angular.module("receta").controller("CheckuotController",
  [ '$scope','$routeParams', '$location', '$resource','$cookies','$cookieStore','myCart'
  ($scope, $routeParams,$location,$resource,$cookies, $cookieStore, myCart, angularAutoFocusq)->

    $scope.focusInput = true

    $scope.orderStatusOk = false
    $scope.user = {}
    $scope.go = (path)->
      $('.bs-example-modal-lg').modal('hide');
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


#angular.module("receta").directive 'foo', ->
#  (scope, element, attrs) ->
#    console.log 'this is my directive'
#    return




#  myApp.directive('scrolly', function () {
#    return {
#        restrict: 'A',
#        link: function (scope, element, attrs) {
#            var raw = element[0];
#            console.log('loading directive');
#
#            element.bind('scroll', function () {
#                console.log('in scroll');
#                console.log(raw.scrollTop + raw.offsetHeight);
#                console.log(raw.scrollHeight);
#                if (raw.scrollTop + raw.offsetHeight > raw.scrollHeight) {
#                    console.log("I am at the bottom");
#                    scope.$apply(attrs.scrolly);
#                }
#            });
#        }
#    };
#});
