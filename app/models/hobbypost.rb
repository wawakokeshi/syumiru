class Hobbypost < ApplicationRecord
  belongs_to :genre
  belongs_to :member
  has_many :comments
  has_one_attached :image

  validates :introduction, :title, :genre_id, presence: { message: "が空になっています。" }
  with_options if: :status==true do
   validates :introduction, presence: true
   validates :title, presence: true
   #validates :genre_id
  end

  validates :introduction, length: { maximum: 400 }, on: :publicize
  validates :title, length: { maximum: 14 }, on: :publicize
end
