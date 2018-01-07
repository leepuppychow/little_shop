class Admin::ItemsController < Admin::BaseController

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name} was created"
      redirect_to item_path(@item)
    else
      binding.pry
      @categories = Category.all
      render :new
    end
  end

  private

    def item_params
      category = Category.find_by(name: params[:item][:category_id])
      permitted_params = params.require(:item).permit(:name, :description, :image, :price, :status)
      permitted_params[:category] = category
      permitted_params
    end

end
