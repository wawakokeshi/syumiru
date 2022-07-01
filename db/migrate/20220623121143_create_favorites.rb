class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :hobbypost_id
      t.integer :member_id
      t.timestamps
    end
  end
end
