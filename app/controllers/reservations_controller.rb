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
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.specs = params['reservation']['specs']
    @reservation.start_date = params['reservation']['start_date']
    @reservation.end_date = params['reservation']['end_date']
    @reservation.save!
    redirect_to user_path(current_user.id)
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :specs)
  end
end
