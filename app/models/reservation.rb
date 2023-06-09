class Reservation < ApplicationRecord
  validates_presence_of :email, :party_size, :time

  def self.by_week(week)
    date = Date.today + (7 * week)
    sunday = date - date.cwday
    next_sunday = date + (7 - date.cwday)

    Reservation.where("time > ?", sunday).where("time < ?", next_sunday)
  end
end
