class OrdersMailer < ApplicationMailer
  default from: "headbat@gmail.com",
  template_path: 'mailers/orders'

  def order_placed(order)
    @order = order
    mails = Shop.mail(Shop.last.id)
    mails ||= 'headbat@gmail.com'

    mail to: [mails],
         from: 'LowOhm<mess-tver@yandex.ru>',
         subject: 'Заказ №'+ @order.id.to_s + ', оформил: '+@order.fio
  end
end
