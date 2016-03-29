ActiveAdmin.register Order do

permit_params :fio, :email, :comment, :phone, :totalPrice,:order

end
