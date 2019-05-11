class OrdersController < ApplicationController
  require "payjp"
  before_action :authenticate_user!

  def index
    @product =  Product.find(params[:product_id])
    @user = User.find(current_user.id)
    @points = Point.where(user_id: current_user.id).first
    @order = Order.new
    @card_infomation = payjp
    @new_product = Product.new
    gon.price = @product.price
    gon.points = @points.point
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
    @product.with_lock do
      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      charge = Payjp::Charge.create(
        amount: @order.payment_price,
        customer: customer,
        currency: 'jpy')
      @order.purchase_amount = charge['id']
      if @order.save
        offset_points(@order.point)
        @product.sold = "1"
        @product.save
        redirect_to action: 'show', product_id: @product.id,id: @order.id
      end
    end
  end

  # ポイントを全額使った場合は消去、一部分なら数値を減少
  def offset_points(used_point)
    @points = Point.where(user_id: current_user.id).first
    if @points.point - used_point == 0
      @points.delete
    else
      @points.point = @points.point - used_point
      @points.save
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
    params.require(:order).permit(:payment_price, :point)
  end
end
