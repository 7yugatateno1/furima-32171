class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      render 'index'
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  #def message_params
    #params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  #end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
