class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    #@items = Item.all
  end

  def new
    #@items = Items.new
  end

  def create
        
  end

  def move_to_index
    #unless user_signed_in?
     # redirect_to action: :index
    end
  end
end