class PurchaseController < ApplicationController
  def index
  end

  def new
    @purchase_address = PurchasesAddresses.new
  end

  def create
    @purchase_address = PurchasesAddresses.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchases_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end
end
