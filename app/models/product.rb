class Product < ActiveRecord::Base

  belongs_to :brand
  belongs_to :nicotine
  has_many :details

  validates_presence_of :price, :title, :brand_id, :description,
                        :presence => true

  validates_numericality_of :price, :greater_than_or_equal_to => 0.0

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
