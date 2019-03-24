class Protest < ApplicationRecord
  has_many :organizers
  has_many :users, through: :organizers

  has_many :rsvp_people

  geocoded_by :location
  after_validation :geocode

  def protestors
    rsvp_people
  end 
end
