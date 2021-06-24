FactoryBot.define do
  factory :item do
    itemes_name    { 'タロウ' }
    text            { 'tarou' }
    category_id    { 2 }
    condition_id    { 2 }
    delivery_charge_id  { 2 }
    delivery_area_id   { 2 }
    day_to_ship_id      { 2 }
    price            { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
