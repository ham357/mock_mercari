class CategoriesController < ApplicationController
  def index
    @main_categories = Category.eager_load(children: :children).where(sub_category_id: nil)
    @sub_categories = Category.eager_load(children: {children: :children}).where(sub_category_id: nil)
  end

  def show
    # カテゴリー詳細ページ
  end
end
