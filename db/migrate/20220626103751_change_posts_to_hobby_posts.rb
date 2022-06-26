class ChangePostsToHobbyPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :hobby_posts
  end
end
