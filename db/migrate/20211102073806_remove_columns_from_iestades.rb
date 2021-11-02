class RemoveColumnsFromIestades < ActiveRecord::Migration[6.1]
  def change
    remove_column :iestades, :iestades_kods, :integer
  end
end
