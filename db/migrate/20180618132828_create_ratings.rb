class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :bands, foreign_key: true
      t.references :events, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
