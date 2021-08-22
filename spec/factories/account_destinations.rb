FactoryBot.define do
  factory :account_destination do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '09012345678' }
  end

end
