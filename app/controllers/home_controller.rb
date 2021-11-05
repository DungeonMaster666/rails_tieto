# frozen_string_literal: true

class HomeController < ApplicationController



  def index

    array_of_age = (1..125).to_a
    @hash_zerofive = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_zerothree = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_sex_s = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_sex_v = Hash[array_of_age.collect { |item| [item, 0] }]
    @hash_indikacijas = Vacin.pluck(:indik_vakcin).uniq
    @hash_indikacijas = Hash[@hash_indikacijas.collect { |item| [item, 0] }]
    @hash_vakcina = Vacin.pluck(:preparat).uniq
    @hash_vakcina = Hash[@hash_vakcina.collect { |item| [item, 0] }]

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
    @hash_vakcina['Covishield'] = @hash_vakcina['Covishield(ChAdOx1_nCoV-19)']
    @hash_vakcina.delete('Covishield(ChAdOx1_nCoV-19)')


    @plots = Plot.all
    @comments = Comment.order('created_at DESC').all
  end

  def index_2
    @array_dates = Vacin.pluck(:vacin_date).uniq
    @array_iestades_nos = Vacin.pluck(:iest_nos).uniq
    @hash_dates = Hash[@array_dates.collect { |item| [item, 0] }]
    @hash_iestades_nos = Hash[@array_iestades_nos.collect { |item| [item, 0] }]

    Vacin.select(:vacin_date, :pers_skaits, :iest_nos).each do |vacin|
      @hash_iestades_nos[vacin.iest_nos] += vacin.pers_skaits
      @hash_dates[vacin.vacin_date] += vacin.pers_skaits
    end
    @hash_dates = @hash_dates.sort

    @hash_iestades_nos.delete_if {|key,value| value < 8000}
    @hash_iestades_nos = @hash_iestades_nos.sort { |l, r| r[1] <=> l[1] }
    @plots = Plot.all
    @comments = Comment.order('created_at DESC').all

  end




  def about
  end

end
