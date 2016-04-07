angular.module("receta").controller("ProductsController",
  [ '$scope', '$routeParams', '$location', '$resource','$cookies','$cookieStore','$window','myCart'
  ($scope,$routeParams,$location,$resource,$cookies, $cookieStore ,$window,myCart)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    angular.element($window).bind("scroll",->

       top = $(document).scrollTop()
       if top < 170
        $(".cart-affix")
        .animate({'opacity': '0'}, 0)

       else
        $(".cart-affix")
        .animate({'opacity': '1'}, 200)

   )

    $scope.go = (path)->
      $('.bs-example-modal-lg').modal('hide')
      $location.path(path)

    myCart.init('products')
    $scope.cartProducts = myCart.listItems()
    $scope.cartTotalPrice = myCart.priceTotal($scope.cartProducts)

    $scope.removeFromCartClick = (product)->
      myCart.removeItem(product)
      updatecartProducts()
      $scope.outOfCart(product)

    $scope.addToCartClick = (product, index)->
      $('.product-card[data-index='+index+'] .product-add_nicotine select')
        .css("border-color","#ccc")

      if product.selected != undefined
        product.nicotine_error = undefined

        if myCart.isInside(product, product.selected['id'])
          console.log('Object is finded true')
        else
          myCart.addItem(product)


        $('.product-card[data-index='+index+']')
          .animate({'opacity': '0.5'}, 200)
          .animate({'opacity': '1'}, 300)
        updatecartProducts()
        $scope.outOfCart(product)



      else

        $('.cart-affix-error[data-index='+index+']')
        .animate({'opacity': '1'}, 200)
        .delay( 1500 )
        .animate({'opacity': '0'},1000)
        $('.product-card[data-index='+index+'] .product-add_nicotine select')
        .css("border-color","red")
        product.nicotine_error = 'А крепкость?'






    $scope.changeQuantity = (product)->
      myCart.updateQuantity(product,$scope.cartProducts[product].quantity)
      $scope.cartTotalPrice = myCart.priceTotal($scope.cartProducts)

    $scope.outOfCart = (product)->
      if myCart.findItem(product) < 0
        return true
      else
        return false

    updatecartProducts= ->
      $scope.cartProducts = myCart.listItems()
      $scope.cartTotalPrice = myCart.priceTotal($scope.cartProducts)


    Nicotines = $resource('/nicotines', { format: 'json' })
    Brands = $resource('/brands', { format: 'json' })


    Nicotines.query((results)-> $scope.nicotines = results )
    Brands.query((results)->
      $scope.brands = results
      $scope.brands = _.sortBy($scope.brands, ['id'])
      getProductByBrand($scope.brands[0].id)

    )

    getProductByBrand= (bandId)->
      Products = $resource('/products', { format: 'json', brand: bandId })
      Products.query((results)-> $scope.products = results )
      $scope.brandInfo = _.find($scope.brands, { 'id': bandId })


    $scope.brandClick= (index,brand)->
      $scope.page = index
      getProductByBrand(brand.id)



])






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
