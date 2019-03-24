class AddImageKeyToProtest < ActiveRecord::Migration[5.2]
  def change
    add_column :protests, :image_key, :string
  end
end
