class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @offer = Offer.find(params[:offer_id])
    @reservation.offer_id = @offer.id
    @reservation.user_id = current_user.id

    if @reservation.save!
      redirect_to offer_path(params[:offer_id])
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :specs)
  end
end
