class ChangePostsToHobbyposts < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :hobbyposts
  end
end
