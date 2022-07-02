class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :hobbypost
  
  enum is_active: { on: true,  off: false }
end
