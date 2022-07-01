class AddStatusToHobbyposts < ActiveRecord::Migration[6.1]
  def change
    add_column :hobbyposts, :status, :boolean, default: true
  end
end
