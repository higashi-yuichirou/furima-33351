require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @list = FactoryBot.create(:list)
    @purchase = FactoryBot.build(:purchase_address, user_id: @user.id, list_id: @list.id)
    sleep 0.1
  end
  context '商品購入できるとき' do
    it '全て入力されていれば登録できること' do
      expect(@purchase).to be_valid
    end

    it 'building_nameが空でも登録できること' do
      @purchase.building_name = ""
      expect(@purchase).to be_valid
    end
  end

  context '商品購入できないとき' do
    it 'post_codeが空だと登録できないこと' do
      @purchase.post_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが全角だと登録できないこと' do
      @purchase.post_code = "０００−００００"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'post_codeにハイフンが入ってないと登録できないこと' do
      @purchase.post_code = "0000000"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'areaが空白だと登録できないこと' do
      @purchase.area = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Area can't be blank")
    end

    it 'areaが1だと登録できないこと' do
      @purchase.area = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Area must be other than 1")
    end

    it 'cityが空白だと登録できないこと' do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'cityは半角英字だと登録できないこと' do
      @purchase.city = "sapporosi"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City is invalid. Input full-width characters")
    end

    it "cityに数字が入っていると登録できないこと" do
      @purchase.city = "札幌市1"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City is invalid. Input full-width characters")
    end

    it "city_numberが空だと登録できないこと" do
      @purchase.city_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City number can't be blank")
    end

    it "phone_numberが空だと登録できないこと" do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと登録できないこと' do
      @purchase.phone_number = "01234567890101010"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
    end
    it "phone_numberが全角だと登録できないこと" do
      @purchase.phone_number = "０８０１２２０２３３０"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
    end

    it "tokenが空だと登録できないこと" do
      @purchase.token = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idが空だと登録できないこと" do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it "list_idが空だと登録できないこと" do
      @purchase.list_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("List can't be blank")
    end
  end
end
