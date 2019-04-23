require "rails_helper"

feature "login" do

  let(:user) { User.create(nickname: 'ONAGAX', email: 'onaga@gamil.com') }

  scenario "Google認証登録ができ、トップページに遷移する" do

    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock(
      user.nickname,
      user.email
    )
    visit new_user_session_url
    find("#google_signin_button").click
    sleep 1
    expect(current_path).to eq root_path
  end

  scenario "facebook認証登録ができ、トップページに遷移する" do

    OmniAuth.config.mock_auth[:facebook] = nil
    Rails.application.env_config['omniauth.auth'] = facebook_mock(
      user.nickname,
      user.email
    )
    visit new_user_session_url
    find("#facebook_signin_button").click
    sleep 1
    expect(current_path).to eq root_path
  end
end
