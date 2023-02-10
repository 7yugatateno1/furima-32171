class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all
  end

  def new
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
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

end
