namespace :upload_plots do
  desc "upload plots db"
  task upload_plots: :environment do
    Plot.delete_all
    Plot.create([{ :plot_name => 'Graph1', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },{ :plot_name => 'Graph2', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },
                { :plot_name => 'Graph3', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },{ :plot_name => 'Graph4', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },
                { :plot_name => 'Graph5', :plot_country=> 'Latvija', :plot_updated_time=> Time.now }])
    end
  end