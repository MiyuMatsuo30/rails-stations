class AddReservationToScreens < ActiveRecord::Migration[7.1]
  def change
    add_reference :screens, :reservation, null: false, foreign_key: true
  end
end
