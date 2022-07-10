class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :hobbypost, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:member_id, :hobbypost_id], unique: true
  end
end
