class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.string :email, null: false, comment: '予約者メールアドレス'
      t.string :name, null: false, comment: '予約者名'

      t.timestamps
    end
  end
end
