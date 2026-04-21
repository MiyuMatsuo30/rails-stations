class Reservation < ApplicationRecord
  validates :schedule_id, uniqueness: { scope: %i[sheet_id date] }
  belongs_to :schedule
  belongs_to :sheet
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{1,})\z/i }
end
