class PurchasesAddresses
  include ActiveModel::Model
  attr_accessor :purchase_id, :post_code, :purchase_id, :prefecture_id, :municipalities, :area, :building_name, :telephone, :user_id, :product_id, :token

  validates :token, presence: true

  with_options presence: true do
    validates :user_id
    validates :product_id
  end

  with_options presence: true do
    #validates :purchase_id
    VALID_POST_CODE_REGEX = /\A^[0-9]{3}-[0-9]{4}$\z/
    validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
    validates :prefecture_id, presence: true
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities, presence: true
    validates :area, presence: true
    validates :building_name
    VALID_TELEPHONE_REGEX = /\A^[0-9]{10,11}$\z/
    validates :telephone, presence: true, format: { with: VALID_TELEPHONE_REGEX }
  end

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Address.create(purchase_id: purchase.id, post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, area: area, building_name: building_name, telephone: telephone)
  end
end