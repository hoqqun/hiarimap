class Hiari < ActiveRecord::Base
  validates :discover_ari_date, presence: true
  validates :longitude, presence: {message: " 住所を検索し、位置を指定してください。"}
  validates :latitude, presence: {message: " 住所を検索し、位置を指定してください。"}
  validates :title, presence: true
  validate :check_date #未来日付チェック

  mount_uploader :image, ImageUploader #deviseの設定配下に追記
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def check_date
    unless discover_ari_date <= Date.today.tomorrow
      errors.add(:discover_ari_date, "　目撃日時が不正です。見直してください。")
    end
  end
end
