class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if User.find_by({"id" => session["user_id"]}) != nil
      @place = Place.find_by({ "id" => params["id"]})
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      flash["notice"] = "Login to view this content."
      redirect_to "/login"
    end
  end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user !=nil
     @place = Place.new
     @place["name"] = params["name"]
     @place["user_id"] = session["user_id"]
     @place.save
    else 
      flash["notice"] = "Login to view this content."
    end
    redirect_to "/places"
  end

end
