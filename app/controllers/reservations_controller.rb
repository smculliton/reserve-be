class ReservationsController < ApplicationController
  def index
    reservations = Reservation.all

    render json: ReservationSerializer.new(reservations), status: 200
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: 'Reservation created successfully'
    else
      render json: 'Error: Reservation not created'
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])

    if reservation
      reservation.destroy
      render json: 'Reservation successfully deleted'
    else
      render json: 'Reservation not found in database'
    end
  end

  private
  def reservation_params
    params.permit(:email, :party_size, :time)
  end
end