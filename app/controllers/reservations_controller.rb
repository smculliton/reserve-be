class ReservationsController < ApplicationController
  def index

  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: 'Reservation created successfully'
    else
      render json: 'Error: Reservation not created'
    end
  end

  private
  def reservation_params
    params.permit(:email, :party_size, :time)
  end
end