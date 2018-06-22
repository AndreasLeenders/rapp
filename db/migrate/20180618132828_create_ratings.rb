class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :booking, foreign_key: true
      t.float :stars

      t.timestamps
    end
  end
end
