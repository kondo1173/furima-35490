FactoryBot.define do
  factory :account_destination do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { 1 }
  end
end
