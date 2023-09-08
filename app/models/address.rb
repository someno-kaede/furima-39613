class Address < ApplicationRecord
  belongs_to :purchase

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"} 

end
