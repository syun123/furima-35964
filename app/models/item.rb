class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :day_to_ship

  has_one_attached :image
  belongs_to :user
  has_one :purchase

  with_options presence: true do
  validates :itemes_name   
  validates :text
  validates :category_id
  validates :condition_id
  validates :delivery_charge_id
  validates :delivery_area_id
  validates :day_to_ship_id
  validates :price 
  # validates :image
  
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id , numericality: { other_than: 1 } 
  validates :delivery_charge_id,numericality: { other_than: 1 } 
  validates :delivery_area_id ,numericality: { other_than: 1 } 
  validates  :day_to_ship_id ,numericality: { other_than: 1 } 

  validates :price ,format: { with: /\A[0-9]+\z/ }
  validates :price ,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 },
                presence:{message:"can't be blank" }
  end
end
