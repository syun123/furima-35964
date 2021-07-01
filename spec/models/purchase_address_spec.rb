require 'rails_helper'

describe PurchaseAddress do
  describe '#create' do
    # 入力されている場合のテスト ▼
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)

      sleep 0.1
    end

    context '購入ができる時' do
      it '全ての項目の入力が存在すれば購入できること' do
        expect(@purchase).to be_valid
      end
       it "building_nameが空でも購入できること" do
        @purchase.building_name = ''
       expect(@purchase).to be_valid
        end
    end
    context '購入ができない時' do
      it 'postal_codeがない場合は購入できないこと' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end

      it 'postal_codeは3桁ハイフン4桁の半角文字列以外の場合購入できないこと' do
        @purchase.postal_code = '123-21211'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idがない場合は購入できないこと' do
        @purchase.prefecture_id = 'nil'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture is not a number")
      end
     it 'prefecture_idで1が選択された場合購入できないこと' do
      @purchase.prefecture_id = '1'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
     end
      it 'municipalityがない場合は購入できないこと' do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberがない場合は購入できないこと' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

     

      it 'phone_numberがない場合は購入できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end

      it 'phone_numberが半角数値でない場合は購入できないこと' do
        @purchase.phone_number = '１２３００９００９０９'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが10桁以上11桁以内でない場合は購入できないこと' do
        @purchase.phone_number = '090090909'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid', 'Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
