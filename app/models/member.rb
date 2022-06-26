class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

 validates :email, presence: true, uniqueness: true
 validates :first_name, :last_name, :last_name_kana, :first_name_kana, :age, :nickname, presence: { message: "が空になっています。" }

 VALID_TELEPHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
 validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX }, presence: true

 validates :age, :numericality => {:only_integer => true, greater_than_or_equal_to: 15}

 enum gender: { male: 0, female: 1 }
 enum is_active: { stay: true,  withdrawal: false }

 def full_name
  self.last_name + self.first_name
 end

end