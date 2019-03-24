class Protest < ApplicationRecord
  has_many :organizers
  has_many :users, through: :organizers

  has_many :rsvp_people

  has_many_attached :images

  geocoded_by :location
  after_validation :geocode

  before_save :add_image_key

  def protestors
    rsvp_people
  end 

  def lat
    latitude
  end

  def lng
    longitude
  end

  def generate_pdf
    pdf = Prawn::Document.new
    pdf.text "hi!"

    pdf
  end

  def upload_image_url
    "https://protestor-ljctmb.herokuapp.com/upload_image/#{self.image_key}"
  end

  def upload_image_qr
    RQRCode::QRCode.new(upload_image_url).as_svg
  end

  private

  def add_image_key
    unless self.image_key
      self.image_key = ('a'..'z').to_a.shuffle[0, 8].join
    end
  end
end
