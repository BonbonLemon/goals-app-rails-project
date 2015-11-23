class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user
      login(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = ["Improper Credentials"]
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
