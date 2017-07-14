class Hiari < ActiveRecord::Base
  mount_uploader :image, ImageUploader #deviseの設定配下に追記
  #geocoded_by :address
  #after_validation :geocode, if: :address_changed?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  belongs_to :user
end
