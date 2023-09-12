class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

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
    @category = Category.find_by_id @product.category_id
    @state = State.find_by_id @product.state_id
    @burden = Burden.find_by_id @product.burden_id
    @prefecture = Prefecture.find_by_id @product.prefecture_id
    @shipping_day = Shippingday.find_by_id @product.shipping_day_id
  end

  def edit
    unless @product.user == current_user && Purchase.where(product_id: @product.id).count == 0
      redirect_to '/'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && Product.find(params[:id]).user_id == current_user.id && Purchase.where(product_id: @product.id).count == 0
      @product.destroy
      redirect_to '/'
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :detail, :category_id, :state_id, :burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
