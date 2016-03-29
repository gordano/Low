angular.module("receta").controller("ProductsController",
  [ '$scope', '$routeParams', '$location', '$resource','$cookies','$cookieStore','myCart'
  ($scope,$routeParams,$location,$resource,$cookies, $cookieStore, myCart)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    $scope.go = (path)->
      $location.path(path)

    myCart.init('products')
    $scope.cartProducts = myCart.listItems()
    $scope.cartTotalPrice = myCart.priceTotal($scope.cartProducts)

    $scope.removeFromCartClick = (product)->
      myCart.removeItem(product)
      updatecartProducts()
      $scope.outOfCart(product)

    $scope.addToCartClick = (product, index)->
      console.log("!!! product id", product.id)
      if product.selected != undefined
        product.nicotine_error = undefined

        if myCart.isInside(product, product.selected['id'])
          console.log('Object is finded true')
        else
          myCart.addItem(product)
        updatecartProducts()
        $scope.outOfCart(product)

      else
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

    Products = $resource('/products', { format: 'json' })
    Nicotines = $resource('/nicotines', { format: 'json' })

    Products.query((results)-> $scope.products = results )
    Nicotines.query((results)-> $scope.nicotines = results )

])


