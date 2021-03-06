class SessionsController < ApplicationController
  def new
  end

  def create

    if user = User.authenticate_with_credentials(params[:login][:email].downcase.strip, params[:login][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else 
      flash.now.alert = "Incorrect email or password, please try again."
      render :new
    end
  end

  def destroy 
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out!"
  end

  # def create
  #   user = User.find_by(email: params[:login][:email].downcase)

  #   if user && user.authenticate(params[:login][:password])
  #     session[:user_id] = user.id.to_s
  #     redirect_to root_path, notice: 'Successfully logged in!'
  #   else 
  #     flash.now.alert = "Incorrect email or password, please try again."
  #     render :new
  #   end
  # end

  # def destroy 
  #   session.delete(:user_id)
  #   redirect_to root_path, notice: "Logged out!"
  # end

end
