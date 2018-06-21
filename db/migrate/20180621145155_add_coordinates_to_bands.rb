class AddCoordinatesToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :latitude, :float
    add_column :bands, :longitude, :float
  end
end
