class Schedule < ApplicationRecord
    validates :start_time, presence: true
    validates :end_time, presence: true
    belongs_to :movie
    belongs_to :screen
    has_many :reservations
    def vis_time(time)
        return time.strftime("%H時%M分")
    end
    def showing_time
        return "#{vis_time(self.start_time)}~#{vis_time(self.end_time)}"
    end
end
