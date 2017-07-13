class Hiari < ActiveRecord::Base
  mount_uploader :image, ImageUploader #deviseの設定配下に追記
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
