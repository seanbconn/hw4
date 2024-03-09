class UsersController < ApplicationController
  def new
  end

  def create
    if User.find_by({ "email" => params["email"] }) == nil
      @user = User.new
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/users/#{@user["id"]}"
    else
      flash["notice"] = "Email in use, account unavailable."
      redirect_to "/users/new"
    end
  end
end
