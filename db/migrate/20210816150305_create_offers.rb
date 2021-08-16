class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
