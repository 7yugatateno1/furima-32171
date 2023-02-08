class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  def move_to_index
    #unless user_signed_in?
     # redirect_to action: :index
    #end
  end
end