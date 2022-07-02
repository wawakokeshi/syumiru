class AddIsActiveToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :is_active, :boolean, default: true
  end
end
