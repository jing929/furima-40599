require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user) # （学習メモ）既存のユーザーと同じemailを持つ新しいユーザーを作成
        another_user.email = @user.email # （学習メモ）既存ユーザーと同じemailを設定
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken') # 新しいユーザーが無効であることを確認
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef' 
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid') 
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456' 
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid') 
      end

      it 'passwordが全角を含むと登録できない' do
        @user.password = 'Ａbcdef' 
        @user.password_confirmation = 'Ａbcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid') 
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '本人情報の名字と名前が空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")

        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '本人情報の名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = "ＡＢＣ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
        
        @user.first_name = "１２３" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")

        @user.last_name = "ＡＢＣ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")

        @user.first_name = "１２３" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '本人情報の名字と名前（カナ）が空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")

        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '本人情報の名字と名前（カナ）が全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
        
        @user.last_name_kana = "ﾔﾏﾀﾞ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
