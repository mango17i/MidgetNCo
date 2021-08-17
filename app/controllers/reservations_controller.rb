class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @offer = Offer.find(params[:offer_id])
    @reservation.offer = @offer

    if @reservation.save
      redirect_to offer_path(params[:offer_id])
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
