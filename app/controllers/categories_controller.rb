class CategoriesController < ApplicationController
  class CategoriesController < ApplicationController
    def index
      # カテゴリー一覧ページ
      @categories = Category.all
      @main_categories = Category.where(sub_category_id: nil, sub_subcategory_id: nil)
      @sub_categories = Category.where(sub_category_id: presence, sub_subcategory_id: nil)
      @sub_subcategories = Category.where(sub_category_id: presence, sub_subcategory_id: presence)
    end
  
    def show
      # カテゴリー詳細ページ
    end
  end
end
