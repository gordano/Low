angular.module('receta',[
  'templates',
  'ngRoute',
  'ngResource',
  'ngCookies',
  'ngMessages',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
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



