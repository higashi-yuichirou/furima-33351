class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :list_id, :post_code, :area, :city_number, :city, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :post_code,    format: {with: /\A[0-9]{3}-[0-9]{4}+\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_number
    validates :city,         format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "is invalid. Input full-width characters"}
    validates :phone_number, format: {with: /\A\d{10,11}+\z/, message: "is invalid."}
    validates :area,         numericality: {other_than: 0, message: "can't be blank"}
    validates :token
  end

  #validates :phone_number, length: { maximum: 11, message: 'Too long' }
  #validates :phone_number, numericality:

  def save
    purchase = Purchase.create(user_id: user_id, list_id: list_id)
    Address.create(post_code: post_code, area: area, city_number: city_number, city: city, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
  