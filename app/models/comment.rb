class Comment < ApplicationRecord
  belongs_to :member, :hobby_post
end
