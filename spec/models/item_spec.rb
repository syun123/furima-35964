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
    it 'category_idの選択肢が「1」では出品できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Category must be other than 1")
    end
    it ' condition_idがない場合は出品できないこと' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Condition can't be blank", "Condition is not a number")
    end
    it 'condition_idの選択肢が「1」では出品できないこと' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Condition must be other than 1")
    end
    
    it ' delivery_charge_idがない場合は出品できないこと' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge can't be blank", "Delivery charge is not a number")
    end
    it 'delivery_charge_idの選択肢が「1」では出品できないこと' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Delivery charge must be other than 1")
    end
    it ' delivery_area_idがない場合は出品できないこと' do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Delivery area can't be blank", "Delivery area is not a number")
    end
    it 'delivery_area_idの選択肢が「1」では出品できないこと' do
      @item.delivery_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Delivery area must be other than 1")
    end
    it ' day_to_ship_idがない場合は出品できないこと' do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank", "Day to ship can't be blank", "Day to ship is not a number")
    end
    it 'day_to_ship_idの選択肢が「1」では出品できないこと' do
      @item.day_to_ship_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Day to ship must be other than 1")
    end
    
    it '全角文字では出品できない'do
    @item.price = '１２３４'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it '半角英語だけでは出品できない'do
  @item.price = 'abcde'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
end
it '半角英数混合では出品できない'do
  @item.price = 'abcde1234'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
end
it 'price がない場合は出品できないこと' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank", "Price can't be blank", "Price is not a number")
end
  it 'priceが299円以下では出品できないこと'do
  @item.price = '200'
  @item.valid?
  expect(@item.errors.full_messages).to include( "Price must be greater than or equal to 300")
end
it 'priceが10,000,000円以上では出品できないこと'do
  @item.price = '100000000000000'
  @item.valid?
  expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999")
end
end
end
end