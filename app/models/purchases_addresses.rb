class PurchasesAddresses
  include ActiveModel::Model
  attr_accessor :purchase_id, :prefecture_id, :municipalities, :area, :building_name, :telephone, :user_id, :product_id

  with_options presence: true do
    validates :purchase_id
    validates :post_code, presence: true
    validates :prefecture_id, presence: true
    validates :municipalities, presence: true
    validates :area, presence: true
    validates :building_name
    validates :telephone, presence: true
    validates :user_id
    validates :product_id
  end

  def save
    Purchase.create(product_id: product_id, user_id: user_id)
    Address.create(purchase_id: purchase_id, prefecture_id: prefecture_id, municipalities: municipalities, area: area, building_name: building_name, telephone: telephone)
  end
end