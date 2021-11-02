class AddIestadeIdToVacins < ActiveRecord::Migration[6.1]
  def change
    add_column :vacins, :iestade_id, :integer
  end
end
