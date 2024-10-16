class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報が更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品が削除されました'
    else
      redirect_to root_path
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :prefecture_id, :shopping_cost_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def redirect_if_sold_out
    if @item.sold_out?
      redirect_to root_path, alert: '売却済みの商品は編集できません。'
    end
  end
end
