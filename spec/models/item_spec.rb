require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'item_nameとdescription、category_id、condition_id、prefecture_id、shopping_cost_id、shopping_day_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Must be other than 1")
      end

      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Must be other than 1")
      end

      it 'prefecture_idが---では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Must be other than 1")
      end

      it 'shopping_cost_idが---では登録できない' do
        @item.shopping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost Must be other than 1")
      end

      it 'shopping_day_idが---では登録できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day Must be other than 1")
      end

      it '価格が¥300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が¥9,999,999を超える場合は保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が半角数値でないと保存できない' do
        @item.price = '３００' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が数値以外の文字列では保存できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が空では保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
