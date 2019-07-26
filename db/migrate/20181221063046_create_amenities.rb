class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :name
      t.text :description
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
