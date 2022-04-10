class PasswordsController < ApplicationController
  before_action :require_user_logged_in!, only: [:edit, :update]

  def edit
  end

  def update
    if Current.user.authenticate(password_params[:old_password]) && Current.user.update({ password: password_params[:password], password_confirmation: password_params[:password_confirmation] })
      redirect_to root_path, notice: "Password Updated"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end
end
