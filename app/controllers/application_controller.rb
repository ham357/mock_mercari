class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action  :get_category_data
  before_action  :Point
  before_action  :payment_price

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :nickname, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def get_category_data
    @main_categories = Category.eager_load(children: {children: :grand_children}).where(sub_category_id: nil)
  end

  def Point
    @point = Point.find_by(user_id: current_user.id)
  end

  def payment_price
    @product = Product.where(user_id: current_user.id)
    if @product.present?
      @payment_price =  @product.inject(0){ |sum, product|
                sum + product.order.payment_price
                }
    end
  end

end
