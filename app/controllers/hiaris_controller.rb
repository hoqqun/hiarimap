class HiarisController < ApplicationController
  def index
    
    @hiari_last = Hiari.last
    @hiari_chokkin = Hiari.order(created_at: :asc).last(3)
    #@hiaris = Hiari.all
    @hiaris = Hiari.near([@hiari_last.latitude,@hiari_last.longitude],1000)
    @hash = Gmaps4rails.build_markers(@hiaris) do | hiari, marker|
      marker.lat hiari.latitude
      marker.lng hiari.longitude
      marker.infowindow render_to_string(partial: "hiaris/infoWindow", locals: {hiari: hiari})
      marker.picture({
        "url" => view_context.image_path('hiari.png'),
        "width" => 50,
        "height" => 50 })
    end
  end
  
  def new
    @hiari = Hiari.new
    @hash = [{lat: 35.5945729, lng: 139.7527161}]
  end

  def create
    @hiari = Hiari.new(hiaris_params)

    @hiari.ipaddress = request.remote_ip
    if verify_recaptcha(model: @hiari, message: "reCAPTCHAエラーです。チェックボックスにチェックを入れてください。") && @hiari.save
      redirect_to root_path, notice: "投稿ありがとうございました！"
    else
      render 'new'
    end
  end

  def getMarkers
    @hiari_chokkin = Hiari.last(3)
    @hiaris = Hiari.near([params[:latitude],params[:longitude]],1000)
    @hash = Gmaps4rails.build_markers(@hiaris) do | hiari, marker|
      marker.lat hiari.latitude
      marker.lng hiari.longitude
      marker.infowindow render_to_string(partial: "hiaris/infoWindow", locals: {hiari: hiari})
      #marker.picture({
      #  "url" => view_context.image_path('hiari.png'),
      #  "width" => 50,
      #  "height" => 50 })
    end
    respond_to do |format|
      format.js {render :markers}
    end
  end

  private

  def hiaris_params
    params.require(:hiari).permit(:title, :comment, :image, :image_cache, :longitude, :latitude, :address, :discover_ari_date )
  end
end
