FactoryBot.define do
  factory :purchase_address do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipality  { '中央区' }
    house_number { '16-3' }
    building_name { '東ビル' }
    phone_number { '01211111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
