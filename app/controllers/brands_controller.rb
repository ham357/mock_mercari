class BrandsController < ApplicationController

  def index
    @brands = Brand.where('name collate utf8_unicode_ci LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

end
