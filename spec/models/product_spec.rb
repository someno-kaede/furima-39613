require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品登録' do
    context '商品登録ができるとき' do 
      it '正しい情報を入力すれば商品登録ができてトップページに移動する' do
        expect(@product).to be_valid
      end
    end

    context '商品登録ができない' do       
      it '商品画像がないと登録ができない' do
       @product.image.attach(io: File.open('README.md'), filename: 'README.md')
       @product.valid?
       #expect(@product.errors.full_messages).to include("Image can't be blank")
       expect(@product).to be_vaild
      end

      it '商品名がないと登録ができない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明がないと登録ができない' do
       @product.detail = ''
       @product.valid?
       expect(@product.errors.full_messages).to include("Detail can't be blank")
      end
      
      it 'カテゴリーIDの項目が「---」だと登録ができない(id:1)' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
 
      #it 'カテゴリーIDに11項目が存在していること' do
      #
      #end
 
      it '商品の状態の項目が「---」だと登録ができない(id:1)' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("State can't be blank")
      end
 
      #it '商品の状態に7項目が存在していること' do
      #
      #end
 
      it '配送料の負担の項目が「---」だと登録ができない(id:1)' do
        @product.burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden can't be blank")
      end
 
      #it '配送料の負担に3項目が存在していること' do
      #
      #end
 
      it '発送元の地域の項目が「---」だと登録ができない(id:1)' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
 
      #it '発送元の地域に48項目が存在していること' do
      #
      #end
 
      it '発送までの日数の項目が「---」だと登録ができない(id:1)' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
 
      #it '発送までの日数に48項目が存在していること' do
      #
      #end
 
      it '価格がないと登録ができない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が299以下だと登録できない' do
        @product.price = Faker::Number.between(from: 0, to: 299)
        @product.valid?
        expect(@product.errors.full_messages).to include("Price price outside the limits")
      end

      it '価格が10000000以上だと登録できない' do
        @product.price = Faker::Number.number(digits: 9)
        @product.valid?
        expect(@product.errors.full_messages).to include("Price price outside the limits")
      end

      it '価格が半角でないと登録できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price price outside the limits")
      end
      
      #it '販売手数料と利益の小数点以下は切り捨てて表示がされる' do
      #
      #end

      #it '出品完了時にトップページに遷移する' do
      #
      #end
    end
  end
end
