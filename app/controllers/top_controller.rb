class TopController < ApplicationController
  def index
    @hiari_last = Hiari.last
    @hiari_chokkin = Hiari.order(created_at: :desc).first(3)
    #@hiaris = Hiari.all
    @hiaris = Hiari.near([@hiari_last.latitude,@hiari_last.longitude],1000)
    @hash = Gmaps4rails.build_markers(@hiaris) do | hiari, marker|
      marker.lat hiari.latitude
      marker.lng hiari.longitude
      marker.infowindow render_to_string(partial: "hiaris/infoWindow", locals: {hiari: hiari})
      #marker.picture({
      #  "url" => view_context.image_path('hiari.png'),
      #  "width" => 50,
      #  "height" => 50 })
    end
  end
end
