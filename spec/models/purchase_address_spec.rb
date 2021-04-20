require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  it '全て入力されていれば登録できること' do
    #binding.pry
    expect(@purchase).to be_valid
  end

  it 'post_codeが空だと登録できないこと' do
    @purchase.post_code = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Post code can't be blank")
  end

  it 'post_codeが全角だと登録できないこと' do
    #binding.pry
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

  it "building_nameは空でも登録できること" do
    @purchase.building_name = ""
    expect(@purchase).to be_valid
  end

  it "phone_numberが空だと登録できないこと" do
    #binding.pry
    @purchase.phone_number = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
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
end
