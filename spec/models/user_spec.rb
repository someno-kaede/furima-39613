require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do 
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        expect(@user).to be_valid
      end
    end
      
    context 'ユーザー新規登録ができないとき' do
      it 'ニックネームが必須であること' do
        @user = FactoryBot.build(:user)
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'メールアドレスが必須であること' do
        @user = FactoryBot.build(:user)
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'メールアドレスが一意性であること' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'パスワードは、半角英数字混合での入力が必須であること(英字のみのテスト)' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    
      it 'パスワードは、半角英数字混合での入力が必須であること(数字のみのテスト)' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it 'パスワードは、半角英数字混合での入力が必須であること(全角のテスト)' do
        @user.password = 'ＡＢＣＤＥＦＧ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字)' do
        @user.last_name = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
  
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前)' do
        @user.first_name = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
  
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること(名字)' do
        @user.reading_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading last name can't be blank")
      end
  
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること(名前)' do
        @user.reading_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name can't be blank")
      end
  
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(名字)' do
        @user.reading_last_name = '12あい亜ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading last name Last name kana is invalid. Input full-width katakana characters")
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(名前)' do
        @user.reading_first_name = '12あい亜ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name First name kana is invalid. Input full-width katakana characters")
      end
  
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end