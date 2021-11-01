class AddPlotUpdatedTimeToPlots < ActiveRecord::Migration[6.1]
  def change
    add_column :plots, :plot_updated_time, :datetime
  end
end
