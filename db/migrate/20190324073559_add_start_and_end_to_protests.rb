class AddStartAndEndToProtests < ActiveRecord::Migration[5.2]
  def change
    add_column :protests, :start, :datetime
    add_column :protests, :end, :datetime
  end
end
