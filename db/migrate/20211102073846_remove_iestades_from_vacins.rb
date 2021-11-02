class RemoveIestadesFromVacins < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacins, :iest_kods, :integert
  end
end
