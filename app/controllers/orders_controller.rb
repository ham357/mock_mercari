class OrdersController < ApplicationController
  require "payjp"
  before_action :authenticate_user!
  before_action :now_product_user, only: %i[index show create]

  def index
    redirect_to root_path if @product.sold == true
    if @user.points.present?
      @points = Point.where(user_id: current_user.id).first
      gon.points = @points.point
    end
    @order = Order.new
    @new_product = Product.new
    @card_infomation = payjp
    gon.price = @product.price
  end

  def show
    @order = Order.find_by(product_id: params[:product_id])
    redirect_to root_path unless @product.sold == true && @order.user_id == current_user.id
  end

  def create
    @order = Order.new(payment_info)
    @order.product_id =  @product.id
    @order.user_id = current_user.id
    if @order.payment_price < 50
      flash.now[:alert] = "50円以下の決済不可"
      render :index
    end
      @product.with_lock do
      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      if charge = Payjp::Charge.create(
        amount: @order.payment_price,
        customer: customer,
        currency: 'jpy')
        @order.purchase_amount = charge['id']
      else
        flash.now[:alert] = "Payjpエラー"
        render :index
      end
      if @order.save
        unless @order.point == nil
          offset_points(@order.point)
        end
        @product.sold = "1"
        @product.save
        redirect_to action: 'show', product_id: @product.id,id: @order.id
      else
        flash.now[:alert] = "購入に失敗しました"
        render :index
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

  def now_product_user
    @product =  Product.find(params[:product_id])
    @user = User.find(current_user.id)
  end

  def payment_info
    params.require(:order).permit(:payment_price, :point)
  end
end
