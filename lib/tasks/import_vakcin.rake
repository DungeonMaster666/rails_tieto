require 'net/http'
require 'openssl'
require 'roo'

namespace :import_vakcin do
  desc "importe vakcinas"
  task import_vakcin: :environment do
    start = Time.now
    url = 'https://data.gov.lv/dati/dataset/7171ccdc-3b01-4852-9dc4-c775bc851829/resource/9320d913-a4a2-4172-b521-73e58c2cfe83/download/adp_covid19_vakc_2021_11_01_1.xlsx'
    file_name = 'lib/seed_csv/vacin_data.xlsx'

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)

    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    get_request = Net::HTTP::Get.new(uri.request_uri)
    request = http.request(get_request)

    file = File.new(file_name, 'wb')
    file.write(request.body)
    file.close
    Vacin.delete_all
    data = Roo::Spreadsheet.open('lib/seed_csv/vacin_data.xlsx')

    @headers = false
    data.each(iestade_id: 'Vakcinācijas iestādes kods', iest_nos: 'Vakcinācijas iestādes nosaukums', vacin_date: 'Vakcinācijas datums', vacin_type: 'Vakcīnas veids', preparat: 'Preparāts', vacin_posms: 'Vakcinācijas posms', vacin_kartas_num: 'Vakcīnas kārtas numurs', prep_daudz: 'Preparāta daudzums ml', vakcin_ievade: 'Vakcīnas ievadīšanas veids', indik_vakcin: 'Indikācijas vakcinācijai', pers_age: 'Vakcinētās personas vecums', pers_dzimums: 'Vakcinētās personas dzimums', pers_skaits: 'Vakcinēto personu skaits') do |hash|
      if @headers == false
        @headers = true
        next
      else
        hash[:user_id] = 2
        Vacin.new(hash).save!
      end
    end
    Plot.delete_all
    Plot.create([{ :plot_name => 'Graph1', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },{ :plot_name => 'Graph2', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },
                 { :plot_name => 'Graph3', :plot_country=> 'Latvija', :plot_updated_time=> Time.now }, { :plot_name => 'Graph4', :plot_country=> 'Latvija', :plot_updated_time=> Time.now },
                 { :plot_name => 'Graph5', :plot_country=> 'Latvija', :plot_updated_time=> Time.now }, {:plot_name => 'Graph6', :plot_country=> 'Latvija', :plot_updated_time=> Time.now}])

    finish = Time.now
    diff = finish - start
    puts "Import duration: #{diff}"
  end
end
