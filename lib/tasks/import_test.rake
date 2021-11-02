require 'net/http'
require 'openssl'
require 'roo'

namespace :import_test do
  desc "importe vakcinas"
  task import_test: :environment do



    data = Roo::Spreadsheet.open('D:\RTU_LAB\ruby\31.xlsx')

    @headers = false
    data.each(iestade_id: 'Vakcinācijas iestādes kods', iest_nos: 'Vakcinācijas iestādes nosaukums', vacin_date: 'Vakcinācijas datums', vacin_type: 'Vakcīnas veids', preparat: 'Preparāts', vacin_posms: 'Vakcinācijas posms', vacin_kartas_num: 'Vakcīnas kārtas numurs', prep_daudz: 'Preparāta daudzums ml', vakcin_ievade: 'Vakcīnas ievadīšanas veids', indik_vakcin: 'Indikācijas vakcinācijai', pers_age: 'Vakcinētās personas vecums', pers_dzimums: 'Vakcinētās personas dzimums', pers_skaits: 'Vakcinēto personu skaits') do |hash|
      if @headers == false
        @headers = true
        next
      else
        hash[:user_id]=2
      Vacin.new(hash).save!

    end



      end
  end
end
