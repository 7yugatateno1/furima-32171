require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do

    #context '商品出品できる場合' do

      #it "全ての項目の入力が存在すれば登録できる" do
        #expect(@item).to be_valid   
      #end
    #end 

    context '商品出品できない場合' do

      #it "imageがない場合は登録できない" do
        #@item.image = ''
        #@item_image.valid?
        #expect(@item.errors.full_messages).to include("Image can't be blank")
      #end

      it "nameがない場合は登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "textがない場合は登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
  
      #it "category_idがない場合は登録できない" do
        #@item.category_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include("Text can't be blank")
      #end
  
      #it "condition_idがない場合は登録できない" do
        #@item.condition_id = ""
        #@item.valid?
        #expect(@item.errors.full_messages).to include("Text can't be blank")
      #end
  
      #it "delivery_cost_idがない場合は登録できない" do
        #@item.delivery_cost_id = ""
        #@item.valid?
        #expect(item.errors[:prefecture_id]).to include("を入力してください")
      #end
  
      #it "sender_area_idがない場合は登録できない" do
        #@item.sender_area_id = ""
        #@item.valid?
        #expect(item.errors[:delivery_days]).to include("を入力してください")
      #end
  
      #it "delivery_day_idがない場合は登録できない" do
        #@item.delivery_day_id = ""
        #@item.valid?
        #expect(item.errors[:price]).to include("を入力してください")
      #end
  
      it "pricedがない場合は登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

    end
  end
end
