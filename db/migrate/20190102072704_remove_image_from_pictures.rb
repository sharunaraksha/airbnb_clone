class RemoveImageFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :image, :string
  end
end
