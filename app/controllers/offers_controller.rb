class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy].freeze

  def index
    @offers = Offer.all
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to offers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(params[:offer])
  end

  def destroy
    @offer.destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :photo)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
