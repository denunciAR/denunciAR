class AddLatitudeAndLongitudeToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :latitude, :string
    add_column :complaints, :longitude, :string
  end
end
