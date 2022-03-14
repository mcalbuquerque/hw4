class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if @current_user
      @place = Place.find(params["id"])
    else
      flash[:notice] = "Please Login first"
      redirect_to "/sessions/new"
    end
  end

  def new
    if @current_user
      @place = Place.new
    else
      flash[:notice] = "Please Login first"
      redirect_to "/sessions/new"
    end
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.save
      redirect_to "/places"
    else
      flash[:notice] = "Please Login first"
      redirect_to "/sessions/new"
    end
  end

end
