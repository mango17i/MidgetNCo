class PagesController < ApplicationController
  def home
    @disable_nav = true
    @offers = Offer.all
    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('https://image.flaticon.com/icons/png/512/809/809042.png')
      }
    end
  end
end
