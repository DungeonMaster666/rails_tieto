class AddUserIdToVacins < ActiveRecord::Migration[6.1]
  def change
    add_column :vacins, :user_id, :integer
    add_index :vacins, :user_id
  end
end
