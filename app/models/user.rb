class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists
  with_options presence: true do
    validates :email
    validates :nickname
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :birth_date
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width characters' } do
    validates :kana_last_name
    validates :kana_first_name
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, presence: true, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
