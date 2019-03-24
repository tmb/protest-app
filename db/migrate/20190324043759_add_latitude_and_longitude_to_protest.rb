class AddLatitudeAndLongitudeToProtest < ActiveRecord::Migration[5.2]
  def change
    add_column :protests, :latitude, :float
    add_column :protests, :longitude, :float
  end
end
