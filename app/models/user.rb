class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  #  validates :email    ,presence: true
  #  validates :email, uniqueness: true
  #  validates :email, inclusion: { in: @ }

  #  validates :encrypted_password ,presence: true
  #  validates :encrypted_password,    length: { minimum: 6}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
  validates :nickname
  validates :surname_kanji
  validates :name_kanji
  validates :surname_katakana
  validates :name_katakana
  validates :birthday
  
  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
  validates :surname_kanji, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :surname_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
  # has_many :items
  # has_many :purchases
  
end
