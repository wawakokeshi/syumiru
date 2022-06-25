class Comment < ApplicationRecord
  belongs_to :member, :post
end
