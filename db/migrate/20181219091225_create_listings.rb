class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :property_type
      t.integer :no_of_guests
      t.integer :price_per_guest
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at]
  end
end
