class BuysController < ApplicationController
  require "payjp"
  before_action :authenticate_user!

  def index
    @product =  Product.find(params[:product_id])
    @user = User.find(current_user.id)
    @card_infomation = payjp
  end

  def payjp
    @card = Card.where(user_id: current_user.id).first
    unless @card.blank?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        card_infomation = customer.cards.retrieve(@card.card_id)
    end
    return card_infomation
  end
end
