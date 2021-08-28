require 'rails_helper'

RSpec.describe AccountDestination, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @account_destination = FactoryBot.build(:account_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@account_destination).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @account_destination.building = ''
        expect(@account_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @account_destination.postal_code = ''
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @account_destination.postal_code = '1234567'
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @account_destination.prefecture_id = 1
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Prefecture Select')
      end
      it 'Addressが空だと保存できないこと' do
        @account_destination.address = ''
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'Cityが空だと保存できないこと' do
        @account_destination.city = ''
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("City can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @account_destination.phone = ''
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が11桁以内の数字でないと保存できないこと' do
        @account_destination.phone = '0901234566789'
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号が9桁以下では保存できないこと' do
        @account_destination.phone = '123456789'
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号が12桁以上では保存できないこと' do
        @account_destination.phone = '090123456789'
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号が英数字混合では保存できないこと' do
        @account_destination.phone = 'abc12345678'
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include('Phone number Input only number')
      end


      it 'userが紐付いていないと購入できないこと' do
        @account_destination.user_id = nil
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @account_destination.token = nil
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @account_destination.item_id = nil
        @account_destination.valid?
        expect(@account_destination.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end
