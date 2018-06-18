class AddIsBandToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_band, :boolean, default: false
    add_column :users, :is_organiser, :boolean, default: false
  end
end
