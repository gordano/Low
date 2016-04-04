angular.module('receta',[
  'templates',
  'ngRoute',
  'ngResource',
  'ngCookies',
  'ngMessages',
  'angular-flash.service',
  'angular-flash.flash-alert-directive',
  'ng-autofocus'

])


.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
         templateUrl: "index.html"
         controller: 'ProductsController'
      ).when('/cart',
        templateUrl: "cart.html"
        controller: 'ProductsController'
      ).when('/checkout',
        templateUrl: "checkout.html"
        controller: 'CheckuotController'
      )
])

.directive 'angularAutoFocus', ->
  {
    restrict: 'A'
    link: (scope, element, attrs) ->
      console.log("sdfsdfsdfsdfsdfsdfsdfHAHAH")
      element.focus()

      return

  }


.directive 'foo',($window)->
  return {
    restrict: 'A'
    link: (scope, element, attrs) ->
      console.log('loading directive');
      i = 0
      while i <= 10
        element.animate({'opacity': '0'}, 600)
        element.animate({'opacity': '1', 'color': 'white'}, 1000)
        i++

  }

