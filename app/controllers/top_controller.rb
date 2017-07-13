class TopController < ApplicationController
  def index
    @hiaris = Hiari.all
  end
end
