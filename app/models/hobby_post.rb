class HobbyPost < ApplicationRecord
  belongs_to :genre
  belongs_to :member
  has_many :comments
  has_one_attached :image
   
  validates :introduction, :title, :genre_id, presence: { message: "が空になっています。" }
end
