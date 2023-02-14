class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at desc")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show

  end

  def edit

    if @item.user_id != current_user.id
      redirect_to root_path
    end
    
  end

  def update
    
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end

  end

  def destroy
    
    if @item.user_id = current_user.id
      @item.destroy
    end

    if @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
