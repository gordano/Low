class ProductsController < ApplicationController
  def index
    @products = Product.where(brand_id:params[:brand])
  end
  def show
    @product = Product.find(params[:id])
  end
end
