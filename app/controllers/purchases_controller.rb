class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :index_create,only:[:index,:create]
  def index
     if @item.purchase == nil && current_user.id != @item.user.id 
    @purchase_address = PurchaseAddress.new
   
     else
      redirect_to root_path
     end
  end

  

  def create
    
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item

      @purchase_address.save
      redirect_to root_path
    else

      render :index

    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

def index_create 
  @item = Item.find(params[:item_id])
end