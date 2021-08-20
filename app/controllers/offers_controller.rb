class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy].freeze

  def index
    @offers = Offer.all
    if params[:query].present?
      @offers = Offer.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
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
    @offer.title = params['offer']['title']
    @offer.description = params['offer']['description']
    @offer.price = params['offer']['price']
    @offer.address = params['offer']['address']
    @offer.save!
    redirect_to user_path(current_user.id)
  end

  def destroy
    @offer.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :address, photos: [])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
