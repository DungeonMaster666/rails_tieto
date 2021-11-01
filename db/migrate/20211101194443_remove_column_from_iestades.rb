class RemoveColumnFromIestades < ActiveRecord::Migration[6.1]
  def change
    remove_column :iestades, :created_at, :datetime
    remove_column :iestades, :updated_at, :datetime
  end
end
