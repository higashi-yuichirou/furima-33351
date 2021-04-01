require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end
  describe '商品出品' do
    context '商品を出品できるとき' do
      it '全ての項目が入力されていると出品できること' do
        expect(@list).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it '画像が選択されてないと出品できないこと' do
        @list.image = nil
        @list.valid?
        expect(@list.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名を入力していないと出品できないこと' do
        @list.name = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明を記述していないと登録できないこと' do
        @list.detail = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Detail can't be blank")
      end

      it '商品のカテゴリーを選択していないと登録できないこと' do
        @list.category_id = nil
        @list.valid?
        expect(@list.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態を選択していないと登録できないこと' do
        @list.status_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担を選択していないと登録できないこと' do
        @list.shipping_fee_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域を選択していないと登録できないこと' do
        @list.location_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Location can't be blank")
      end

      it '発送までの日数を選択していないと登録できないこと' do
        @list.shipping_date_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping date can't be blank")
      end

      it '販売価格を入力していないと登録でいないこと' do
        @list.price = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格の値が300未満だったら登録できないこと' do
        @list.price = 299
        @list.valid?
        expect(@list.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格の値が9999999以上だったら登録できないこと' do
        @list.price = 10000000
        @list.valid?
        expect(@list.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
