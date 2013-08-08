class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate( params[:email], params[:password] )
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Incorrect email or password."
      #render 'new'
      redirect_to sign_in_path
    end
  end
end
