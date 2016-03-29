ActiveAdmin.register Product do

permit_params :title, :brand_id, :description, :price, :image, :nicotine_id, :product

form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs do
    f.input :title
    f.input :brand_id, :label => 'Brand', :as => :select, :collection => Brand.all.map{|u| ["#{u.title}", u.id]}
    #f.input :nicotine_id, :label => 'Nicotine', :as => :select, :collection => Nicotine.all.map{|u| ["#{u.count}", u.id]}
    f.input :description
    f.input :price
    f.input :image, hint: f.product.image? ? image_tag(f.product.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
  end
  f.actions
end


end
