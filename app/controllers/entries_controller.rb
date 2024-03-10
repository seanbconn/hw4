class EntriesController < ApplicationController
    def new
      @user = User.find_by({ "id" => session["user_id"] })
    end

    def create
      @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["image"] = params["image"]     **********************************************************************
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = session["user_id"]
      @entry.save
    else
      flash["notice"] = "Login to create content."
    end
    redirect_to "/login"
  end 
end
