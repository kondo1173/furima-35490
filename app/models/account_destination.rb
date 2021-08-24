class AccountDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} 
    validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{11}\z/, message: "number Input only number"} 
    validates :user_id 
    validates :token
  end


  def save
    account = Account.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, account_id: account.id)
  end
  


end
