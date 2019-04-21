class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    @user.build_user_info
  end

  def create
    @user = User.new(strong_params)
    @user.save!
    redirect_to users_path(@user)
  end

  private

  def strong_params
    params.require(:user).permit(
      :nickname, :email, :password, :password_confirmation,user_info_attributes:[:id, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_year, :birth_month, :birth_day],
      )
  end
end
