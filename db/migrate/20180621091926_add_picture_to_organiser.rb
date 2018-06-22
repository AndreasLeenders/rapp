class AddPictureToOrganiser < ActiveRecord::Migration[5.2]
  def change

    add_column :organisers, :picture, :string, default: "http://www.madaboutmemes.com/uploads/memes/224.jpg"
  end
end
