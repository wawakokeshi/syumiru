class Hobbypost < ApplicationRecord
  belongs_to :genre
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :favorites, through: :comments, source: :hobbypost, dependent: :destroy
  has_one_attached :image

  #validates :introduction, :title, :genre_id, presence: { message: "が空になっています。" }
  with_options if: :status==true do
   validates :introduction, presence: true
   validates :title, presence: true
  end
  validates :introduction, length: { maximum: 400 }, on: :publicize
  validates :title, length: { maximum: 14 }, on: :publicize

  def favorited?(member)
   favorites.where(member_id: member.id).exists?
  end

  enum is_active: { on: true,  off: false }
  #enum status: { 公開中: true,  下書き保存: false }

end
