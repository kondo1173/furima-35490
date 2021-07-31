require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '#create' do
    before do
    @item = FactoryBot.build(:item)
    end
    
    describe '商品の出品' do
      context "商品が保存できる場合" do
        it "画像と商品名と商品説明、商品の詳細（カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格）があれば投稿できる" do
          expect(@item).to be_valid
        end
      end
 
      context "商品が保存できない場合" do
        it "画像がなければ、出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "商品のカテゴリー選択がなければ、出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "商品の状態の説明がなければ、出品できない" do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end

        it "配送料の負担説明がなければ、出品できない" do
          @item.shopping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping fee status can't be blank")
        end

        it "発送元地域の説明がなければ、出品できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end


        it "発送までの日数説明がなければ、出品できない" do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end


        it "価格が空では、出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "価格が300円より少ない場合は、出品できない" do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "価格が9,999,999円より多い場合は、出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "価格が全角では出品できない" do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end

        it "半角英数混合では登録できないこと " do
          @item.price = "a300"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end

        it "半角英語だけでは登録できないこと " do
          @item.price = "aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end


        it "ユーザーが紐づいていないと出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

      end

    end


  end
end
