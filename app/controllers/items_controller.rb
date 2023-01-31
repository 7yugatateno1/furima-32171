class Item < ApplicationRecord
  def index
    @items = Items.all
  end
end