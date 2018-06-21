class AddPictureToOrganiser < ActiveRecord::Migration[5.2]
  def change
    add_column :organisers, :picture, :string, default: "https://static1.squarespace.com/static/55fc0004e4b069a519961e2d/t/55fc301ae4b01342ae9212a1/1442590746805/?format=500w"
  end
end
