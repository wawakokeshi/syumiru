class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :mebmer
  has_many :comments
end
