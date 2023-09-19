class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  
  validates :nickname, presence: true
  VAILD_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true, format: { with: VAILD_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VAILD_NAME_REGEX }
  VAILD_READING_NAME_REGEX = /\A[ァ-ヶー]+\z/
  validates :reading_first_name, presence: true, format: { with: VAILD_READING_NAME_REGEX, message: 'First name kana is invalid. Input full-width katakana characters'}
  validates :reading_last_name, presence: true, format: { with: VAILD_READING_NAME_REGEX, message: 'Last name kana is invalid. Input full-width katakana characters'}
  validates :birthday, presence: true
  #has_many :purchases
  has_many :products

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end
end
