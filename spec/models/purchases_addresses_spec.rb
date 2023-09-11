require 'rails_helper'

RSpec.describe PurchasesAddresses, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    #purchase = FactoryBot.create(:purchase)
    @purchases_addresses = FactoryBot.build(:purchases_addresses, user_id: @user.id, product_id: @product.id)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchases_addresses).to be_valid
      end
      #it 'は空でも保存できること' do
      #end
    end
  end
end
