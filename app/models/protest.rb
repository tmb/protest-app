class Protest < ApplicationRecord
  has_many :organizers
  has_many :users, through: :organizers

  has_many :rsvp_people

  before_save :update_lat_long

  def protestors
    rsvp_people
  end 

  private

  def update_lat_long
    coords = Geocoder.search(self.location).first.coordinates
    self.latitude = coords[0]
    self.longitude = coords[1]
  end
end
