class Sheet < ApplicationRecord
  has_many :reservations
  belongs_to :screen
  def name
    "#{row}-#{column}"
  end

  def can_book(date, schedule_id)
    reservation = Reservation.where('date = ? AND schedule_id = ? AND sheet_id = ?', date, schedule_id, id)
    reservation.nil?
  end
end
