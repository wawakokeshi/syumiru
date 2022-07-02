class Favorite < ApplicationRecord
 belongs_to :mebmer, optional: true
 belongs_to :hobbypost
end
