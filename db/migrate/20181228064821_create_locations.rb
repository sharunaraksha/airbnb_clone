class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
