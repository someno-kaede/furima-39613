require 'rails_helper'

RSpec.describe PurchasesAddresses, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    #purchase = FactoryBot.create(:purchase)
    @purchases_addresses = FactoryBot.build(:purchases_addresses, user_id: @user.id, product_id: @product.id)
    sleep 0.01      #エラー「MySQL client is not connected」の対処
  end

  describe 'ユーザー新規登録' do
    context '商品購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchases_addresses).to be_valid
      end

      it '建物名は空でも保存できる' do
        @purchases_addresses.building_name = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'トークン情報がない場合' do
        @purchases_addresses.token = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Token can't be blank")
      end
      
      it '郵便番号がない場合' do
        @purchases_addresses.post_code = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Post code can't be blank")
      end
      
      it '郵便番号にハイフンが含まれていない場合' do
        @purchases_addresses.post_code = '1234567'
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it '郵便番号の桁数が少ない場合' do
        @purchases_addresses.post_code = '123-456'
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it '郵便番号の桁数が多い場合' do
        @purchases_addresses.post_code = '123-45678'
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県がない場合' do
        @purchases_addresses.prefecture_id = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県の選択がid1(「---」)である場合' do
        @purchases_addresses.prefecture_id = 1
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村がない場合' do
        @purchases_addresses.municipalities = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地がない場合' do
        @purchases_addresses.area = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Area can't be blank")
      end

      it '電話番号がない場合' do
        @purchases_addresses.telephone = ''
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Telephone can't be blank")
      end

      it '電話番号にハイフンが含まれている場合' do
        @purchases_addresses.telephone = '123-4567-8901'
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Telephone is invalid")
      end

      it '電話番号の桁数が少ない場合' do
        @purchases_addresses.telephone = 1234567
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Telephone is invalid")
      end

      it '電話番号の桁数が多い場合' do
        @purchases_addresses.telephone = 1234567890123
        @purchases_addresses.valid?
        expect(@purchases_addresses.errors.full_messages).to include("Telephone is invalid")
      end
    end
  end
end
