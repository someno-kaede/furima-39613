class Product < ApplicationRecord
  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shippingday
  
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :state_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"} 
  validates :burden_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"} 
  validates :shipping_day_id, numericality: {other_than: 1, message: "can't be blank"}

  #validates :user, presence: true, foregin_key: true
  validates :product_name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  VAILD_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, format: { with: VAILD_PRICE_REGEX }
  has_one_attached :image
  ##belongs_to :user
  ##has_one :purchase
end
