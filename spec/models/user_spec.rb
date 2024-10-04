require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nickname:必須' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'email:必須' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'email:一意性必須' do
      @user.save
      another_user = FactoryBot.build(:user) # 既存のユーザーと同じemailを持つ新しいユーザーを作成
      another_user.email = @user.email # 既存ユーザーと同じemailを設定
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken') # 新しいユーザーが無効であることを確認

      another_user = FactoryBot.build(:user, email: "another@example.com") # 別のメールアドレスを持つユーザー
      expect(another_user).to be_valid # 別のメールアドレスなら有効であることを確認
    end

    it 'email:@を含むこと必須' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'password:必須' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password:6文字以上必須' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'password:半角英数字混合での入力必須' do
      @user.password = 'abcdef' # 英字のみ
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid') 

      @user.password = '123456' # 数字のみ
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid') 

      @user.password = 'abc123' # 半角英数字混合
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid # 英数字混合なら登録可能であることを確認
    end

    it 'パスワードとパスワード（確認）:値の一致必須' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'お名前(全角):名字と名前必須' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")

      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'お名前(全角):全角（漢字・ひらがな・カタカナ）での入力必須' do
      @user.first_name = "ＡＢＣ" # 英字
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
      
      @user.first_name = "１２３" # 数字
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")

      @user.last_name = "ＡＢＣ" # 英字
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")

      @user.first_name = "１２３" # 数字
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'お名前カナ(全角):名字と名前必須' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")

      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'お名前カナ(全角):全角（カタカナ）での入力必須' do
      @user.first_name_kana = "ﾀﾛｳ" # 半角
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      
      @user.last_name_kana = "ﾔﾏﾀﾞ" # 半角
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it '生年月日:必須' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
