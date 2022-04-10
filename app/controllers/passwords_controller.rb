class PasswordsController < ApplicationController
  before_action :require_user_logged_in!, only: [:edit, :update]

  def edit
    Current.user
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password Updated"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
