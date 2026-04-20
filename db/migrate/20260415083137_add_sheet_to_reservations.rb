class AddSheetToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :sheet, null: false, foreign_key: true
  end
end
