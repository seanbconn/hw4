class EntriesController < ApplicationController

  def new
  end

  def create
    if User.find_by({"id" => session["user_id"]}) != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = session["user_id"]
      @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else
      flash["notice"] = "Login to create content."
      redirect_to "/login"
    end 
  end

end
