require 'rails_helper'

describe UsersController, type: :controller do

  describe 'GET #new' do
    it "newを描画できている" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    it "2つのテーブルに情報を保存でき、トップページへリダイレクトできている" do
      expect do
        post :create,
          params: {user:{
                    id: "1",
                    nickname: "onagaway",
                    email: "onagaway@gmail.com",
                    password: "a"*6,
                    password_confirmation: "a"*6,
                    user_info_attributes: attributes_for(:user_info,
                      user_id: "1",
                      first_name: "おなが",
                      last_name: "しょう",
                      kana_first_name: "オナガ",
                      kana_last_name: "ショウ",
                      birth_year: "1986",
                      birth_month: "06",
                      birth_day: "10"
                    )}}
      end.to change(UserInfo, :count).by(1)
      expect(response).to redirect_to root_path
    end

  end

end
