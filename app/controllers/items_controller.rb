class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

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

  #def authenticate_user
    #if Item.find(params[:id]).seller != current_user
      #redirect_to root_path
    #end
  #end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
