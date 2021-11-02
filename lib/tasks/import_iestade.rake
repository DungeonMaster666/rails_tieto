require 'net/http'
require 'openssl'
require 'roo'



namespace :import_iestade do
  desc "importe iestades"
  task import_iestade: :environment do

    url = 'https://registri.vi.gov.lv/sites/default/files/inline-files/Atbilstiba_19.10.2021.xlsx'
    file_name = 'lib/seed_csv/iestades_data.xlsx'

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

    data = Roo::Spreadsheet.open('lib/seed_csv/iestades_data.xlsx')
    @hash_test=[]
    @headers2 = 1
    data.each(id: 'Ārstniecības iestādes kods', iestades_nos: 'Nosaukums') do |hash|
      if @headers2 == 1 || @headers2 == 2
        @headers2 += 1
        next
      else
      end

      @hash_test.push(hash)


    end
    puts "before1: "+ @hash_test.count.to_s
    @hash_test.uniq!
    puts "before2: "+ @hash_test.count.to_s
    @hash_test= @hash_test.uniq {|obj| obj[:id]}
    puts "before3: "+ @hash_test.count.to_s
    @hash_test= @hash_test.uniq {|obj| obj[:iestades_nos]}
    puts "before4: "+ @hash_test.count.to_s

    @hash_test.each do |obj|
      if obj[:id]==nil || obj[:iestades_nos]==nil || obj[:id]==""
        puts obj
        @hash_test.delete(obj)
      end
      Iestade.new(obj).save!
    end

    puts "after: "+ @hash_test.count.to_s

    puts 'DONE'
    puts file.path.to_str

  end
end
