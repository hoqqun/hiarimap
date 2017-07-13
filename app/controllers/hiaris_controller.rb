class HiarisController < ApplicationController
  def index
    
    #@hiaris = Hiari.all
    @hiari_last = Hiari.last
    @hiaris = Hiari.near([@hiari_last.latitude,@hiari_last.longitude],30)
    @hash = Gmaps4rails.build_markers(@hiaris) do | hiari, marker|
      marker.lat hiari.latitude
      marker.lng hiari.longitude
      marker.infowindow hiari.comment
      #marker.picture({
      #  "url" => view_context.image_path('hiari.png'),
      #  "width" => 50,
      #  "height" => 50 })
    end
  end
  
  def new
    @hiari = Hiari.new
  end

  def create
    @hiari = Hiari.new(hiaris_params)
    #@hiari.user_id = current_user.id
    if @hiari.save
      redirect_to hiaris_path, notice: "ヒアリ目撃情報を投稿しました！"
    else
      render 'new'
    end
  end

  private

  def hiaris_params
    params.require(:hiari).permit(:title, :comment, :image, :image_cache, :longitude, :latitude, :address )
  end
end
