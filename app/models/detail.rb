class Detail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :nicotine
end
