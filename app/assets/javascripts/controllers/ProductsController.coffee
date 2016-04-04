angular.module("receta").controller("ProductsController",
  [ '$scope', '$routeParams', '$location', '$resource','$cookies','$cookieStore','myCart'
  ($scope,$routeParams,$location,$resource,$cookies, $cookieStore, myCart)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)



    $scope.go = (path,$event)->
      $('.bs-example-modal-lg').modal('hide')
      #console.log('element',$event.target)
      $location.path(path)

    myCart.init('products')
    $scope.cartProducts = myCart.listItems()
    $scope.cartTotalPrice = myCart.priceTotal($scope.cartProducts)

    $scope.removeFromCartClick = (product)->
      myCart.removeItem(product)
      updatecartProducts()
      $scope.outOfCart(product)

    $scope.addToCartClick = (product, index)->
      #$('.product-add_nicotine select').css('border':'1px solid red')
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


