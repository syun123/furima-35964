require 'rails_helper'

describe Item do
  describe '#create' do
    # 入力されている場合のテスト ▼
    before do
      @item = FactoryBot.build(:item)
    end
    context '出品ができる時' do

    it '全ての項目の入力が存在すれば出品できること' do
      expect(@item).to be_valid
    end
  end
  context '出品ができない時' do

    it 'imageがない場合は出品できないこと' do 
      @item.image = nil
      @item.valid? 
      expect(@item.errors.full_messages).to include("Image can't be blank") 
    end
    it ' itemes_nameがない場合は出品できないこと' do
      @item.itemes_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Itemes name can't be blank")
    end
    it ' textがない場合は出品できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it ' category_idがない場合は出品できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank", "Category is not a number")
    end
    it ' condition_idがない場合は出品できないこと' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition can't be blank", "Condition is not a number")
    end
    
    it ' delivery_charge_idがない場合は出品できないこと' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge can't be blank", "Delivery charge is not a number")
    end
    it ' delivery_area_idがない場合は出品できないこと' do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area can't be blank", "Delivery area is not a number")
    end
    it ' day_to_ship_idがない場合は出品できないこと' do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank", "Day to ship can't be blank", "Day to ship is not a number")
    end
    it 'price がない場合は出品できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price can't be blank", "Price is invalid", "Price can't be blank", "Price is not a number")
    end
    it 'priceは半角数値以外の場合出品できない'do
    @item.price = '１２３４５'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

  it '価格は、¥300~¥9,999,999の間のみ出品可能であること'do
  @item.price = '200'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
end

end
end
end