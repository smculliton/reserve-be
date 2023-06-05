class Api::V1::AvailabilityController < ApplicationController
  def index
    date = request.headers[:date].to_datetime
    hours = Hour.first 
    reservations = Reservation.by_day(date)
    availability = []
    
    start = DateTime.new(date.year, date.month, date.day, hours.weekday_start)
    limit = DateTime.new(date.year, date.month, date.day, hours.weekday_end)

    start.step(limit, (1.to_f/48)).each{ |e| availability << e }
    
    reservations.each { |r| availability.delete(r.time) }

    render json: { date: date, availability: availability }.to_json
  end

  private

  def weekly_schedule
    {
      sun: [],
      mon: [],
      tue: [],
      wed: [],
      thu: [],
      fri: [],
      sat: []
    }
  end
end