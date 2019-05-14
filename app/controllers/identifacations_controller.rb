class IdentifacationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(current_user.id)
        @user_info = UserInfo.find(@user)
    end

end
