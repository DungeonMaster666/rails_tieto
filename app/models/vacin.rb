class Vacin < ApplicationRecord
  belongs_to :user
  belongs_to :iestade
  validates :iestade_id, presence: true
  validates :iest_nos, presence: true
  validates :vacin_date, presence: true
  validates :vacin_type, presence: true
  validates :preparat, presence: true
  validates :vacin_posms, presence: true
  validates :vacin_kartas_num, presence: true
  validates :prep_daudz, presence: true
  validates :vakcin_ievade, presence: true
  validates :indik_vakcin, presence: true
  validates :pers_age, presence: true
  validates :pers_dzimums, presence: true
  validates :pers_skaits, presence: true

end
