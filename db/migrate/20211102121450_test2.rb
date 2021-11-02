class Test2 < ActiveRecord::Migration[6.1]
  def change
    change_table :vacins do |t|
      t.remove :iestade_id ,:iest_nos ,:vacin_date ,:vacin_type ,:preparat ,:vacin_posms ,:vacin_kartas_num ,:prep_daudz ,:vakcin_ievade , :pers_age ,:pers_dzimums , :pers_skaits, :user_id
    end

    add_column :vacins, :iestade_id, :integer
    add_column :vacins, :iest_nos, :string
    add_column :vacins, :vacin_date, :date
    add_column :vacins, :vacin_type, :string
    add_column :vacins, :preparat, :string
    add_column :vacins, :vacin_posms, :string
    add_column :vacins, :vacin_kartas_num, :integer
    add_column :vacins, :prep_daudz, :string
    add_column :vacins, :vakcin_ievade, :string
    add_column :vacins, :indik_vakcin, :string
    add_column :vacins, :pers_age, :integer
    add_column :vacins, :pers_dzimums, :string
    add_column :vacins, :pers_skaits, :integer
    add_column :vacins, :user_id, :integer, default: "0"
  end
end
