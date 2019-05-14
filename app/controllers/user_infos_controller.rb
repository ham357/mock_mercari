class UserInfosController < ApplicationController

  def update
    @user = User.find(current_user.id)
    @user.user_info.update(strong_params)
    redirect_to root_path(@user), notice: "ユーザー情報を更新しました"
  end


  def strong_params
    params.require(:user_info).permit(
        :postal_code, :city, :address, :address2, :state_id
        )
  end

end
