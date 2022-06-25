class Post < ApplicationRecord
  belongs_to :genre, :mebmer
  has_many :comments
end
