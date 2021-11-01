class CreateVacins < ActiveRecord::Migration[6.1]
  def change
    create_table :vacins do |t|
      t.integer :iest_kods
      t.string :iest_nos
      t.date :vacin_date
      t.string :vacin_type
      t.string :preparat
      t.string :vacin_posms
      t.integer :vacin_kartas_num
      t.float :prep_daudz
      t.string :vakcin_ievade
      t.string :indik_vakcin
      t.integer :pers_age
      t.string :pers_dzimums
      t.integer :pers_skaits

      t.timestamps
    end
  end
end
