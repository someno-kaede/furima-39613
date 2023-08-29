class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @products = Product.find(params[:id])
    @category = Category.find_by_id @products.category_id
    @state = State.find_by_id @products.state_id
    @burden = Burden.find_by_id @products.burden_id
    @prefecture = Prefecture.find_by_id @products.prefecture_id
    @shipping_day = Shippingday.find_by_id @products.shipping_day_id
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :detail, :category_id, :state_id, :burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
