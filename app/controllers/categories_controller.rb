class CategoriesController < ApplicationController
  def show
    @products = Product.order("created_at DESC")
  end
end
