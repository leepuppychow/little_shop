class CategoriesController < ApplicationController

  def show
    c = Category.find_by(name: params[:category_name])

  end

end
