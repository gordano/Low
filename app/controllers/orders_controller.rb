class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    orderInfo = JSON.parse(params['jsonOrder'])

    @order = Order.new()
    @order.totalPrice = 0
    @order.fio = orderInfo['userInfo']['fio']
    @order.phone = orderInfo['userInfo']['phone']
    @order.email = orderInfo['userInfo']['email']
    @order.comment = orderInfo['userInfo']['comment']
    orderInfo['productsInfo'].each do |product|
      @order.details_attributes = [{product_id: product['id'],
                                    nicotine_id: product['nicotineId'],
                                    product_count: product['quantity'] }]
      @order.totalPrice += Product.find(product['id'].to_i).price * product['quantity'].to_i
    end
    p '***********************************************************'
    p @order.totalPrice
    p '***********************************************************'
    if @order.save
      render nothing: true, status: 204
      OrdersMailer.order_placed(@order).deliver
    end



  end
end
