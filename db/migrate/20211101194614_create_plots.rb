class CreatePlots < ActiveRecord::Migration[6.1]
  def change
    create_table :plots do |t|
      t.string :plot_name
      t.string :plot_country

      t.timestamps
    end
  end
end
