class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully Logged In"
    else
      flash[:alert] = "Your Credentials Could Not Be Validated"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
