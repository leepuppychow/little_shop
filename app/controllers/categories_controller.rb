class CategoriesController < ApplicationController

  def index

  end

  def show
    @category = Category.find_by(slug: params[:category_slug])
  end

end
