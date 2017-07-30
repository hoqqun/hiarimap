class Hiari < ActiveRecord::Base
  validates :discove_ari_date, presence: true
  validates :title, presence: true
  
  mount_uploader :image, ImageUploader #deviseの設定配下に追記
  #geocoded_by :address
  #after_validation :geocode, if: :address_changed?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  #belongs_to :user
end
