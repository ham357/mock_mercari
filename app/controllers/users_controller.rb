class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @product = Product.where(user_id: params[:id])
    @user_info = UserInfo.find_by(user_id: @user.id)
    @product = Product.where(user_id: @user.id)
    @search_rate3 = search_rate(3)
    @search_rate2 = search_rate(2)
    @search_rate1 = search_rate(1)
    @valution = @search_rate3.count - @search_rate1.count
    @exclusion_products = Product.where(user_id: params[:id]).limit(6)
end

  def new
    @user = User.new
    @user.build_user_info
  end

  def create
    @user = User.new(strong_params)
    @user.save!
    @user_image = UserImage.new(user_id: @user.id,image_url: 'member_no_image.png')
    @user_image.save!
    sign_in @user
    redirect_to root_path(@user), notice: "ユーザー情報を登録しました (ログイン済み)"
  end

    # ユーザーの評価の配列を取り出す関数
    def search_rate(rate)
        @rate_id = @user.id
        @return = Rate.where(user_id: @rate_id, rate: rate)
    end


  private

  def strong_params
    params.require(:user).permit(
      :nickname, :email, :password, :password_confirmation,user_info_attributes:[:id, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_year, :birth_month, :birth_day],
      )
  end
end
