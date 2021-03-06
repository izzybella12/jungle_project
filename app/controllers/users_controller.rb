class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    puts @user.inspect

    if @user.save 
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      flash.now.alert = "Oops, couldn't create account. Please make sure you're using a valid email and password."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation
    )
  end

end
