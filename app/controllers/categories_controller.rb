class CategoriesController < ApplicationController

  def index

  end

  def show
    @category = Category.find_by(name: params[:category_name])
  end

end
