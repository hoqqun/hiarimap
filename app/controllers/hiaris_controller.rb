class HiarisController < ApplicationController
  def index
    
    @hiari_last = Hiari.last
    @hiari_chokkin = Hiari.last(3)
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
  
  def new
    @hiari = Hiari.new
    @hash = [{lat: 35.5945729, lng: 139.7527161}]
  end

  def create
    @hiari = Hiari.new(hiaris_params)
    
    @hiari.user_id = current_user.id
    if @hiari.save
      redirect_to hiaris_path, notice: "ヒアリ目撃情報を投稿しました！"
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
    params.require(:hiari).permit(:title, :comment, :image, :image_cache, :longitude, :latitude, :address )
  end
end
