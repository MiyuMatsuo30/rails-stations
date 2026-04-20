class CreateScreens < ActiveRecord::Migration[7.1]
  def change
    create_table :screens do |t|
      t.integer :name
      t.timestamps
    end

    add_reference :schedules, :screen, null: false, foreign_key: true
    add_reference :sheets, :screen, null: false, foreign_key: true
  end
end
