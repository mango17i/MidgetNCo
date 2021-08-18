class AddSpecsToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :specs, :string
  end
end
