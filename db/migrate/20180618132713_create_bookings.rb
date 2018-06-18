class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :bands, foreign_key: true
      t.references :events, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
