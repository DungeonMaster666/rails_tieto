class Changecolumntype < ActiveRecord::Migration[6.1]
  def change
    change_table :vacins do |t|
      t.change :iestade_id, :string
      t.index :id
    end
    change_table :iestades do |t|
      t.change :id, :string
    end
  end
end
