# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    array_of_age = (1..130).to_a
    @hash_zerofive = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_zerothree = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_sex_s = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_sex_v = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_indikacijas = Hash['Persona ar hroniskām slimībām; ' => 0, 'Kontakts ar personām ar hroniskām slimībām; ' => 0,
                             'Grūtniece; ' => 0, 'Cits iedzīvotājs; ' => 0, 'Persona vecumā virs 60 gadiem; ' => 0,
                             'Vakcinēts ārzemēs; ' => 0, 'Cita paaugstinātā riska grupa; ' => 0, 'Ārstniecības persona; ' => 0,
                             'Citas veselības indikācijas; ' => 0, 'Nozaru prioritāro iestāžu darbinieks; ' => 0,
                             'Izglītības iestāžu darbinieks; ' => 0, 'Imūnsupresīva persona ; ' => 0,
                             'Ārstniecības iestādes darbinieks; ' => 0, 'Operatīvo dienestu darbinieks; ' => 0,
                             'Pēc paša vēlēšanās; ' => 0, 'SAC darbinieks; ' => 0, 'Ieslodzījumu vietu pārvaldes personāls; ' => 0,
                             'Epidemioloģiskās indikācijas - kontakts ar infekcijas slimnieku; ' => 0,
                             'Plānveida vakcinācija (pēc vakcinācijas kalendāra); ' => 0, 'SAC klients; ' => 0,
                             'Speciālo iestāžu klients; ' => 0, 'Ieslodzītais; ' => 0, 'Pirms ceļojuma; ' => 0,
                             'Veselības indikācijas - trauma, zarnu trakta operācija; ' => 0,
                             'Epidemioloģiskās indikācijas - uzliesmojums, epidēmija; ' => 0]
    @hash_vakcina = Hash['Spikevax'=> 0,'Comirnaty'=> 0, 'Vaxzevria'=> 0, 'COVID-19 Vaccine Janssen'=> 0, 'BBIBP-CorV(Sinopharm)'=> 0,
                         'Covishield(ChAdOx1_nCoV-19)'=> 0, 'CoronaVac(Sinovac)'=> 0]

    Vacin.select(:prep_daudz, :pers_age, :pers_skaits, :pers_dzimums, :indik_vakcin, :preparat).each do |vacin|
      @hash_indikacijas[vacin.indik_vakcin] += vacin.pers_skaits
      @hash_vakcina[vacin.preparat] += vacin.pers_skaits

      case vacin.pers_dzimums
      when 'S'
        @hash_sex_s[vacin.pers_age] += vacin.pers_skaits
      when 'V'
        @hash_sex_v[vacin.pers_age] += vacin.pers_skaits
      end
      case vacin.prep_daudz
      when '0.5'
        @hash_zerofive[vacin.pers_age] += vacin.pers_skaits
      when '0.3'
        @hash_zerothree[vacin.pers_age] += vacin.pers_skaits
      end
    end
    # hash sorting and my first comment
    @hash_indikacijas = @hash_indikacijas.sort { |l, r| r[1] <=> l[1] }
  end

  def about; end
end
