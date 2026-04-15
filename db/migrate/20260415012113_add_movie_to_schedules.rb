class AddMovieToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :movie, null: false, foreign_key: true
  end
end
