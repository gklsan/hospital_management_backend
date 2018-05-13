class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :disease, presence: true
end
