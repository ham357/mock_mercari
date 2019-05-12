require 'rails_helper'

describe CardsController, type: :controller do

  describe 'GET #index' do
    before do
      user = FactoryBot.create(:user)
      sign_in user
    end
    it "indexのテンプレートが表示されているか" do
      get :index
      expect(response).to render_template :index
    end
  end
end
