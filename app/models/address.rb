class Address < ApplicationRecord
  belongs_to :purchase

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
