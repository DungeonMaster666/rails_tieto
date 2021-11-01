class CreateIestades < ActiveRecord::Migration[6.1]
  def change
    create_table :iestades do |t|
      t.integer :iestades_kods
      t.string :iestades_nos

      t.timestamps
    end
  end
end
