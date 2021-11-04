class Vacin < ApplicationRecord
  belongs_to :user
  belongs_to :iestade
  validates :iestade_id, presence: true , format: {with: /\A\d+\Z/, message: '- Ievadiet tikai skaitļus'}
  validates :iest_nos, presence: true
  validates :vacin_date, presence: true
  validates :vacin_type, presence: true
  validates :preparat, presence: true
  validates :vacin_posms, presence: true
  validates :vacin_kartas_num, presence: true, format: {with: /\A\d\Z/, message: ',- Ievadiet tikai vienu skaitli'}
  validates :prep_daudz, presence: true, format: {with: /\A([0-9][.][0-9]+|[0-9])\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli'}
  validates :vakcin_ievade, presence: true
  validates :indik_vakcin, presence: true
  validates :pers_age, presence: true, format: {with: /\A([1-9][0-9]|[1-9]|[1-9][0-9][0-9])\Z/, message: '- Ievadiet reālo vecumu'}
  validates :pers_dzimums, presence: true, format: {with: /\A[S|V]\Z/, message: '- Ievadiet tikai S vai V'}
  validates :pers_skaits, presence: true, format: {with: /\A[1-9]+[0-9]*\Z/, message: '- Ievadiet tikai veselo skaitli'}

end
