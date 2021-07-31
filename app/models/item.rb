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
    validates :name, length:{ maximum: 40 }
    validates :info, length:{ maximum: 1000 }
    validates :category_id,                numericality:{ other_than: 1 , message: "can't be blank"}
    validates :sales_status_id,            numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :shopping_fee_status_id,     numericality:{ other_than: 1 , message: "can't be blank"}   
    validates :prefecture_id,              numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :scheduled_delivery_id,      numericality:{ other_than: 1 , message: "can't be blank"} 
    validates :price,                      numericality:{ greater_than: 300, less_than: 9999999, message: "is out of setting range"}
    validates :image
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }


end
