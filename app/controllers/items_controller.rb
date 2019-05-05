class ItemsController < ApplicationController
  def index
  @products = Product.where(id: 1..6)
  end
end
