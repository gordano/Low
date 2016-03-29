angular.module("receta")
  .factory('myCart', [ '$cookieStore', (cookies)->

    cart = {}

    itemsCookie = ''
    cart.init= (itemsCookie)->
      @itemsCookie = itemsCookie
      if (! (cookies.get(@itemsCookie) instanceof Array))
        cookies.put(@itemsCookie, [])

    cart.clearList = ->
      cookies.remove(@itemsCookie)

    cart.addItem= (product, quantity)->
      if quantity == undefined
        quantity =1
      items = cookies.get(@itemsCookie)
      items.push
        id: product.id
        title: product.title
        quantity: quantity
        nicotine: product.selected['count']
        nicotineId: product.selected['id']
        price: product.price
        brand: product.brand['title']
      cookies.put @itemsCookie, items
      return
    cart.removeItem= (product)->
      items = cookies.get(@itemsCookie)
      items.splice(product,1)
      cookies.put @itemsCookie, items
      return

    cart.updateQuantity= (index, quantity)->
      items = cookies.get(@itemsCookie)
      items[index].quantity = quantity
      cookies.put @itemsCookie, items
      return

    cart.priceTotal= (products)->
      total = 0
      items = products
      i = 0
      while i < items.length
        total += @priceSub(items[i])
        i++
      total

    cart.priceSub= (item)->
      item.price * item.quantity

    cart.isInside=(product, nicotine)->
      items = cookies.get(@itemsCookie)
      item =_.find(items, { 'id': product.id, 'nicotineId': nicotine })
      itemIndex = items.indexOf(item)
      if item
        items[itemIndex].quantity += 1
        cookies.put @itemsCookie, items
        true
      else
        false

    cart.isEqualNicotine= (index, nicotine)->
      items = cookies.get(@itemsCookie)
      true if items[index].nicotineId == nicotine

    cart.findItem= (index)->
      items = cookies.get(@itemsCookie)
      _.findIndex(items, (o)->
        return o.id == index.id )


    cart.listItems = ->
      items = cookies.get(@itemsCookie)
      items
    cart
    ])



