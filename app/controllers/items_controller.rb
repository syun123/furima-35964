class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user.id == current_user.id

    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  # def show
  # @item = Item.show
  # end

  private

  def item_params
    params.require(:item).permit(:image, :itemes_name, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id,
                                 :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
