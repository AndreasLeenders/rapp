class CreateBandCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :band_categories do |t|
      t.references :bands, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
