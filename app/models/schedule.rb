class Schedule < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :movie
  belongs_to :screen
  has_many :reservations
  def vis_time(time)
    time.strftime('%H時%M分')
  end

  def showing_time
    "#{vis_time(start_time)}~#{vis_time(end_time)}"
  end
end
