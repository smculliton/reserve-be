class ReservationsController < ApplicationController
  def index
    week = request.headers[:week].to_i || 0
    reservations = Reservation.by_week(week)

    render json: ReservationSerializer.new(reservations), status: 200
  end

  def show
    reservation = Reservation.find_by(id: params[:id])

    if reservation
      render json: ReservationSerializer.new(reservation), status: 200
    else
      render json: 'Reservation not found in database'
    end
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