class SessionsController < ApplicationController
# Should this code include "user_id" or "email"?
def new
  render :template => "sessions/new"
end

def create
  @user = User.find_by({ "email" => params["email"] })
  if @user != nil
    if BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "Have fun saving your places and creating location based entries!"
      redirect_to "/places"
    else
      flash["notice"] = "That email and password combination was not recognized. Try again."
      redirect_to "/login"
    end
  else
    flash["notice"] = "You do not currently have an account and have been redirected to signup."
    redirect_to "/users/new"
  end
end

def destroy
  session["user_id"] = nil
  flash["notice"] = "Goodbye."
  redirect_to "/login"
end
end