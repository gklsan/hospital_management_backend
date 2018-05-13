class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :phone, presence: true
  validates :specialization, presence: true
end
