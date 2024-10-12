class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :prefecture_id, :shopping_cost_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
