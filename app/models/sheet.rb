class Sheet < ApplicationRecord
    has_many :reservations
    belongs_to :screen
    def name
        return self.row + "-" + self.column.to_s
    end
    def can_book(date,schedule_id)
        reservation = Reservation.where("date = ? AND schedule_id = ? AND sheet_id = ?",date,schedule_id,self.id)
        return  reservation.nil?
    end
end
