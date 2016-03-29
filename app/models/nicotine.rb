class Nicotine < ActiveRecord::Base
  has_many :products
  has_many :details
end
