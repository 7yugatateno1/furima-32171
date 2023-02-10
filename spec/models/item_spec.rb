require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do

    context '商品出品できる場合' do

      #it "全ての項目の入力が存在すれば登録できる" do
        #expect(@item).to be_valid   
      #end
    end 

    context '商品出品できない場合' do

      #it "imageがない場合は登録できない" do
        #@item.image = ''
        #@item.valid?
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
  
      it "category_idの「---」が選択された場合は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
  
      it "condition_idの「---」が選択された場合は保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
  
      it "delivery_cost_idの「---」が選択された場合は保存できない" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end
  
      it "sender_area_idの「---」が選択された場合は保存できない" do
        @item.sender_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area must be other than 1")
      end
  
      it "delivery_day_idの「---」が選択された場合は保存できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
  
      it "priceがない場合は登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは半角数字以外の値が含まれている場合は保存できない" do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300未満の値では保存できない" do
        @item.price = 5
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが10000000以上の値では保存できない" do
        @item.price = '123456789'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
