FactoryBot.define do
  factory :user do
    nickname { 'abc' }
    kanji_lastname { '山田' }
    kanji_firstname { '太郎' }
    katakana_lastname { 'ヤマダ' }
    katakana_firstname { 'タロウ' }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    birthday { '1930-01-01' }
  end
end
