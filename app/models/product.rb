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
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates_inclusion_of :price, in:300..9999999, message: "price outside the limits"
  has_one_attached :image
  validates :image, presence: true
  belongs_to :user
  ##has_one :purchase
end
