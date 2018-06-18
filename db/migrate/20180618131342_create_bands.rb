class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :content
      t.string :pictures
      t.string :soundcloud
      t.string :location

      t.timestamps
    end
  end
end
