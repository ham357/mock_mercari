class CardsController < ApplicationController
    require "payjp"
    before_action :authenticate_user!

    def index
        @card = Card.where(user_id: current_user.id).first
        unless @card.blank?
            Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
            customer = Payjp::Customer.retrieve(@card.customer_id)
            @card_infomation = customer.cards.retrieve(@card.card_id)
        end
    end

    def create
    end

    def new
    end

    def pay
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.create(card: params[:payjpToken])
        @card = Card.new(user_id: current_user.id,
                            customer_id: customer.id,
                            card_id: customer.default_card)
        if @card.save
        redirect_to action: "index"
        else
        redirect_to action: "pay"
        end
    end

    def delete
        binding.pry
        @card = Card.where(user_id: current_user.id).first
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        customer.delete
        @card.delete
        redirect_to action: "index"
      end
end
