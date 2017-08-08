class TopController < ApplicationController
  def index
    @hiari_last = Hiari.last
    @hiari_chokkin = Hiari.order(created_at: :desc).first(3)
    #@hiaris = Hiari.all
    # 東京駅を中心に半径1,200kmのデータを取得する。 データ量多くなるとやばいかも。
    @hiaris = Hiari.near([35.6811673,139.767051560000006],1200)
    #@hiaris = Hiari.near([@hiari_last.latitude,@hiari_last.longitude],1000)
    @hash = Gmaps4rails.build_markers(@hiaris) do | hiari, marker|
      marker.lat hiari.latitude
      marker.lng hiari.longitude
      marker.infowindow render_to_string(partial: "hiaris/infoWindow", locals: {hiari: hiari})
      case hiari.reliability
        when 1
          markerURL = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=低|FFCC00|FFFFFF"
        when 2
          markerURL = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=中|FF6600|FFFFFF"
        when 3
          markerURL = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=高|FF0000|FFFFFF"
        else
          markerURL = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=高|FF0000|FFFFFF"
      end
      marker.picture({
        #"url" => ActionController::Base.helpers.image_url('hiari.png'),
        "url" => markerURL,
        "width" => 36,
        "height" => 36 })
    end
  end
end
