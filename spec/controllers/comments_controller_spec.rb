require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { create(:user)}
  before do
    allow(controller).to receive(:current_user).and_return(user)
  end
  describe 'POST #create' do
    context 'commentが届いてるか' do
      it 'きちんと保存できているか' do
        product = create(:product, user_id: user.id, name: 'あああ')
        expect do
          post :create,params: {comment:{comment: "ああああ",
                                         product_id: product.id
                                }}
          end.to change(Comment, :count).by(1)
      end
      it '保存後元のページにとんでいるか' do
        product = create(:product, user_id: user.id, name: 'あああ')
        post :create,params: {comment:{comment: "ああああ",
                              product_id: product.id
                              }}
        expect(response).to redirect_to product_path(product.id)
      end
    end
  end
end
