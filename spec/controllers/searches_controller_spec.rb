require 'rails_helper'

describe SearchesController, type: :controller do
  describe 'post #search' do
    it "空白をいれても何も検索できない" do
      keyword = " "
      get :index
      expect(assigns(@products)).to be nil
    end

  end
end
