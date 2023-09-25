class CategoriesController < ApplicationController
  def show
    @products = Product.order("created_at DESC")
    @category = Category.find(params[:id])
    @categories = Category.all
  end
end
