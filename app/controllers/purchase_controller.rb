class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @product = Product.find(params[:product_id])
    @burden = Burden.find_by_id @product.burden_id
    if @product.user == current_user
      redirect_to '/'
    end
    @purchase_address = PurchasesAddresses.new
  end

  def new
    #@purchase_address = PurchasesAddresses.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_address = PurchasesAddresses.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchases_addresses).permit(:post_code, :prefecture_id, :municipalities, :area, :building_name, :telephone).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,        # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end
end
