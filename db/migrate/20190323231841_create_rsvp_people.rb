class CreateRsvpPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvp_people do |t|
      t.text :name
      t.text :email
      t.text :phone_number
      t.references :protest, foreign_key: true

      t.timestamps
    end
  end
end
