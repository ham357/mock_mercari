class OrdersController < ApplicationController
  require "payjp"
  before_action :authenticate_user!

  def index
    @product =  Product.find(params[:product_id])
    @user = User.find(current_user.id)
    @order = Order.new
    @card_infomation = payjp
    @new_product = Product.new
  end

  def show
    @product =  Product.find(params[:product_id])
    @user = User.find(current_user.id)
  end

  def create
    @product =  Product.find(params[:product_id])
    @order = Order.new(payment_info)
    @order.product_id =  @product.id
    @order.user_id = current_user.id
    if @order.payment_price != @product.price
      redirect_to root_path
    end
    @product.with_lock do
      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      charge = Payjp::Charge.create(
        amount: @order.payment_price,
        customer: customer,
        currency: 'jpy'
      )
      @order.purchase_amount = charge['id']
      if @order.save
        @product.sold = "1"
        @product.save
        redirect_to action: 'show', product_id: @product.id,id: @order.id
      end
    end
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

  private

  def payment_info
    params.require(:order).permit(:payment_price)
  end
end
