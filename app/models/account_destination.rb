class AccountDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は、ハイフン(-)を入れて入力してください。' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください。' }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'は、半角数字で入力してください。' }
    validates :user_id
    validates :token
    validates :item_id
  end

  def save
    account = Account.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                       phone: phone, account_id: account.id)
  end
end
