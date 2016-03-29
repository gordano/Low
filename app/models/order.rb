class Order < ActiveRecord::Base
  has_many :details
  accepts_nested_attributes_for :details
end
