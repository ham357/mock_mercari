class CardsController < ApplicationController
    require "payjp"
    before_action :authenticate_user!
    before_action :set_request_from,only: :index

    def index
        @card = Card.where(user_id: current_user.id).first
        unless @card.blank?
            Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
            customer = Payjp::Customer.retrieve(@card.customer_id)
            @card_infomation = customer.cards.retrieve(@card.card_id)
        end
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
            redirect_to session.delete(:return_to)
        else
            redirect_to pay_cards_path
        end
    end

    def delete
        @card = Card.where(user_id: current_user.id).first
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        customer.delete
        @card.delete
        redirect_to cards_path
    end

    def set_request_from
        session[:return_to] = request.referer
    end

end
