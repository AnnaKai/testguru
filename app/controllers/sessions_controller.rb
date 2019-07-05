class SessionsController < ApplicationController

  def new
    redirect_to tests_path unless session[:user_id].nil?
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:referrer]
    else
      flash.now[:error] = "Email or Password is wrong"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
