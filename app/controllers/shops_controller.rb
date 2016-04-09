class ShopsController < ApplicationController
  def index
    @shop = Shop.where(id: Shop.last.id)
  end
end
