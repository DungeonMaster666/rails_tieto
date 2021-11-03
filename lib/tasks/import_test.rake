

namespace :import_test do
  desc "importe vakcinas"
  task import_test: :environment do

    array_of_age = (1..130).to_a
    @hash_zerofive=Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_zerothree=Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_indikacijas=Hash["Persona ar hroniskām slimībām; "=> 0, 'Kontakts ar personām ar hroniskām slimībām; '=> 0, 'Grūtniece; '=> 0, 'Cits iedzīvotājs; '=> 0,'Persona vecumā virs 60 gadiem; '=> 0,'Vakcinēts ārzemēs; '=> 0, 'Cita paaugstinātā riska grupa; '=> 0, 'Ārstniecības persona; '=> 0, 'Citas veselības indikācijas; '=> 0,'Nozaru prioritāro iestāžu darbinieks; '=> 0,'Izglītības iestāžu darbinieks; '=> 0,'Imūnsupresīva persona ; '=> 0,'Ārstniecības iestādes darbinieks; '=> 0, 'Operatīvo dienestu darbinieks; '=> 0, 'Pēc paša vēlēšanās; '=> 0,'SAC darbinieks; '=> 0,'Ieslodzījumu vietu pārvaldes personāls; '=> 0,'Epidemioloģiskās indikācijas - kontakts ar infekcijas slimnieku; '=> 0,'Plānveida vakcinācija (pēc vakcinācijas kalendāra); '=> 0,'SAC klients; '=> 0, 'Speciālo iestāžu klients; '=> 0, 'Ieslodzītais; '=> 0,'Pirms ceļojuma; '=> 0,'Veselības indikācijas - trauma, zarnu trakta operācija; '=> 0,'Epidemioloģiskās indikācijas - uzliesmojums, epidēmija; '=> 0]
    @counter=0
    @hash_vakcina = Hash['Spikevax'=> 0,'Comirnaty'=> 0, 'Vaxzevria'=> 0, 'COVID-19 Vaccine Janssen'=> 0, 'BBIBP-CorV(Sinopharm)'=> 0,
                         'Covishield(ChAdOx1_nCoV-19)'=> 0, 'CoronaVac(Sinovac)'=> 0]
    @hash_potes_karta=Hash[1 => 0, 2 => 0, 3 => 0]
    @test_array = Vacin.pluck(:vacin_date).uniq
    @test_array = Hash[@test_array.collect { |item| [item, 0] }]

    Vacin.select(:vacin_date, :pers_skaits).each do |vacin|
      @test_array[vacin.vacin_date] += vacin.pers_skaits
    end
    puts @test_array
  end
end
