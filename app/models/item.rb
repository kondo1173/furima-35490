class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shopping_fee_status

  belongs_to :user
  has_one_attached :image

  
  
  
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id,                numericality:{ other_than: 1 , message: "can't be blank"}
    validates :sales_status_id,            numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :shopping_fee_status_id,     numericality:{ other_than: 1 , message: "can't be blank"}   
    validates :prefecture_id,              numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :scheduled_delivery_id,      numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :price,                      numericality:{ greater_than: 300, less_than: 9999999, message: "Price is out of setting range"}
    validates :image
  end

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Price is invalid. Input half-width characters'



end
