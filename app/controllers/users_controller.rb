class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @products = Product.order("created_at DESC")
  end
end
