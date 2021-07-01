class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id,
                :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :municipality
    # validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    # message: "is invalid. Include hyphen(-)"}
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true

    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                   house_number: house_number, building_name: building_name, purchase_id: purchase.id)
  end
end
