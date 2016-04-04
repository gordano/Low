class OrdersMailer < ApplicationMailer
   default from: "headbat@gmail.com",
  template_path: 'mailers/orders'

  def order_placed(order)
    @order = order
    mail to: 'headbat@gmail.com',
         subject: 'Order Placed'

  end
end
