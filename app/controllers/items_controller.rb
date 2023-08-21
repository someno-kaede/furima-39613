class ItemsController < ApplicationController
  def index
    @products = Product.all

    #@products = Product.order("created_at DESC")
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

  private

  def product_params
    params.require(:product).permit(:category_id, :state_id, :burden_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
