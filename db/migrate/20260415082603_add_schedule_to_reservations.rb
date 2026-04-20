class AddScheduleToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :schedule, null: false, foreign_key: true
  end
end
