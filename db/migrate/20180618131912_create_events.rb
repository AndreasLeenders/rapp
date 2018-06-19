class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :organiser, foreign_key: true
      t.string :name
      t.datetime :date_begin
      t.datetime :date_end
      t.integer :capacity
      t.text :equipment
      t.integer :price
      t.text :commodities
      t.string :city
      t.string :location
      t.string :pictures


      t.timestamps
    end
  end
end
