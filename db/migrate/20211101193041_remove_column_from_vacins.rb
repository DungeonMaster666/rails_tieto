class RemoveColumnFromVacins < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacins, :created_at, :datetime
    remove_column :vacins, :updated_at, :datetime
  end
end
