class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :band, foreign_key: true
      t.references :event, foreign_key: true
      t.string :status, default: "Pending"
      t.text :message
      t.text :answer
      t.timestamps
    end
  end
end
