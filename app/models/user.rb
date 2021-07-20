class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :birthday, presence: true



  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力して下さい。' } do
    validates :kanji_firstname
    validates :kanji_lastname
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' } do
    validates :katakana_firstname
    validates :katakana_lastname
  end

end



