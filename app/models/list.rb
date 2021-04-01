class List < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :location
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :location_id
    validates :shipping_date_id
    validates :price

  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :location_id
    validates :shipping_date_id
  end
    validates_inclusion_of :price, in:300..9999999

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'
  has_one :purchase
end
