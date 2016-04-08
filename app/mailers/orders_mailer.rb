class OrdersMailer < ApplicationMailer
   default from: "headbat@gmail.com",
  template_path: 'mailers/orders'

  def order_placed(order)
    @order = order
    mail to: ['headbat@gmail.com'],
         from: 'LowOhm<mess-tver@yandex.ru>',
         #subject: @test.user.name + ': Тест пройден.'
         subject: 'Заказ №'+ @order.id.to_s + ', оформил: '+@order.fio

  end
end
