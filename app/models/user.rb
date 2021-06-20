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
         validates :encrypted_password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }

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
