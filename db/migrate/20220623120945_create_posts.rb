class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
 
      t.integer :genre_id
      t.integer :member_id
      t.string :title, null: false
      t.string :introduction, null: false
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
