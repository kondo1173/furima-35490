class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shopping_fee_status

  belongs_to :user
  has_one :account
  has_one_attached :image
  has_many :comments

  with_options presence: true, numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'は、範囲内で設定してください。' }
    validates :image
  end

  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください。' }
end
