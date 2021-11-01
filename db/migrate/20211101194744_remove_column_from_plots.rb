class RemoveColumnFromPlots < ActiveRecord::Migration[6.1]
  def change
    remove_column :plots, :created_at, :datetime
    remove_column :plots, :updated_at, :datetime
  end
end
