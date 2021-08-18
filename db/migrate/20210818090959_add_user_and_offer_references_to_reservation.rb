class AddUserAndOfferReferencesToReservation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :offer, null: false, foreign_key: true
  end
end
