class SessionsController < ApplicationController

  def static
    render 'static/welcome'
  end

  def new
  end

  def create
    user = User.find_by( email: params[:email].downcase )
    user = user.authenticate( params[:password] )
    if user
      session[:user_id] = user.id
      sign_in(user)
      redirect_to users_path, notice: "Logged In!"
    else
      flash.now.alert = "Incorrect email or password."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    sign_out
    redirect_to root_path, notice: "Successfully Logged Out!"
  end
end
