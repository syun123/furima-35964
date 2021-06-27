class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set, only: [:update, :show, :edit]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :itemes_name, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id,
                                 :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set
    @item = Item.find(params[:id])
  end
end

def move_to_index
  return redirect_to root_path if @item.user.id != current_user.id
end
