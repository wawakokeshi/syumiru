class Favorite < ApplicationRecord
 belongs_to :member
 belongs_to :hobbypost
 
 validates :member_id, uniqueness: { scope: :hobbypost_id } 
end
