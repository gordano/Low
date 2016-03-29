class Shop < ActiveRecord::Base
  validates_presence_of :email, :title, :about, :phone,
                        :presence => true
  validates_format_of   :email,
                        :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_numericality_of :phone, only_integer: true
end
