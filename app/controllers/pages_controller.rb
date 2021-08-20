class PagesController < ApplicationController
  def home
    @disable_nav = true
    @offers = Offer.all
    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end
end
