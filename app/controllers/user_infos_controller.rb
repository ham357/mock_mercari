class UserInfosController < ApplicationController

  before_action :authenticate_user!
  before_action :set_request_from,only: :index

  def index
    @user = User.find(current_user.id)
    @user_info = UserInfo.find_by(user_id: @user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.user_info.update(strong_params)
      redirect_to session.delete(:return_to), notice: "ユーザー情報を更新しました"
    else
      redirect_to :back, error: @user_infos.errors.full_messages
    end
  end


  def strong_params
    params.require(:user_info).permit(
        :postal_code, :city, :address, :address2, :state_id
        )
  end


  def set_request_from
    request.referer.include?('sign_up') ? session[:return_to] = cards_path : session[:return_to] = request.referer
  end

end
