class CreateEventCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :event_categories do |t|
      t.references :categories, foreign_key: true
      t.references :events, foreign_key: true

      t.timestamps
    end
  end
end
