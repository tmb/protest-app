class RsvpPerson < ApplicationRecord
  belongs_to :protest

  validates :name, :presence => true
  validates :email, :presence => true
end
