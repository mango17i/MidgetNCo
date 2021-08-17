class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      refirect_to offer_path(@offer)
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
    params.require(:offer).permit(:title, :description, :price)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
