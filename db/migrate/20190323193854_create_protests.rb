class CreateProtests < ActiveRecord::Migration[5.2]
  def change
    create_table :protests do |t|
      t.text :name
      t.text :location
      t.text :description
      t.text :what_to_bring
      t.references :organizer, foreign_key: true

      t.timestamps
    end
  end
end
