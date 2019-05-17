class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(current_user.id)
        @user_info = UserInfo.find_by(user_id: @user.id)
    end

    def update
        @user = User.find(current_user.id)
        if @user.update(strong_params)
            redirect_to mypages_path, notice: "更新完了しました"
        end
    end

    private

    def strong_params
      params.require(:user).permit(
        :nickname,
        user_info_attributes:[:profile_comment,:id],
        )
    end
end
