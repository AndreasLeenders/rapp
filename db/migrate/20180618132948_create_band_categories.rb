class CreateBandCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :band_categories do |t|
      t.references :band, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
