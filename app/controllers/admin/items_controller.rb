class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
    @items = Item.ordered_by_id
  end

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
      @categories = Category.all
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    if params[:update_item]
      update_status(params[:update_item])
    elsif @item.update(item_params)
      flash[:notice] = "#{@item.name} was updated"
      redirect_to item_path(@item)
    else
      @categories = Category.all
      render :edit
    end
  end

  def update_status(params)
    @item.status = params
    retired_counter
    @item.save
    redirect_to admin_items_path
  end

  def retired_counter
    if @item.status == "retired"
      @item.retired_count += 1
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
