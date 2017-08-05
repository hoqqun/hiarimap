# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Hiari.create!([
  {latitude: 34.6905685985705, longitude: 135.206772699414, comment: "神戸港にてヒアリが発見された。", image: nil, discover_ari_date: "2017-06-22 01:18:00", title: "日本発、発見", address: "日本、〒651-0082 兵庫県神戸市中央区小野浜町７−３０ 国土交通省近畿地方整備局", user_id: nil, ipaddress: "10.0.2.2"}
])