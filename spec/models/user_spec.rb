require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context 'ユーザー登録がうまくいかない時' do

        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'password:半角英字のみの場合、登録できない' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'password:半角数字のみの場合、登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'password:全角の場合、登録できない' do
          @user.password = '１２３４５６'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end


        it 'passwordが６文字より少ない場合は登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end




        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end


        it '生年月日が空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it '名字（全角）が空では登録できない' do
          @user.kanji_lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji lastname can't be blank")
        end

        it '名前（全角）が空では登録できない' do
          @user.kanji_firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kanji firstname can't be blank")
        end

        it '名字（フリガナ）が空では登録できない' do
          @user.katakana_lastname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana lastname can't be blank")
        end

        it '名前（フリガナ）が空では登録できない' do
          @user.katakana_firstname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Katakana firstname can't be blank")
        end
      end







      context '新規登録がうまくいく時' do
        it 'nickname,email,passwordとpassword_confirmationとお名前（全角）及びお名前（カナ全角）、生年月日が存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = '12345a'
          @user.password_confirmation = '12345a'
          expect(@user).to be_valid
        end

        it 'passwordは、半角英数字混合での入力が必須であること' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end




      end
    end
  end
end
