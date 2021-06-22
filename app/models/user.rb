class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname ,presence: true
        #  validates :email    ,presence: true
        #  validates :email, uniqueness: true
        #  validates :email, inclusion: { in: @ }

        #  validates :encrypted_password ,presence: true
        #  validates :encrypted_password,    length: { minimum: 6}
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 


         validates :surname_kanji ,presence: true
         validates :name_kanji ,presence: true
         validates :surname_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/}
         validates :name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/}

         validates :surname_katakana,presence: true
         validates :name_katakana ,presence: true
         validates :surname_katakana, format:{ with: /\A[ァ-ヶー－]+\z/}
         validates :name_katakana, format:{ with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday  ,presence:true

         has_many :items
         has_many :purchases
end
