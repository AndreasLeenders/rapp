class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :content
      t.string :pictures, default: "https://static1.squarespace.com/static/55fc0004e4b069a519961e2d/t/55fc301ae4b01342ae9212a1/1442590746805/?format=500w"
      t.string :soundcloud
      t.string :location

      t.timestamps
    end
  end
end
