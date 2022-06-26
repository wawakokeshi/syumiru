class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :hobbypost_id
      t.integer :member_id
      t.string :content
      t.timestamps
    end
  end
end
