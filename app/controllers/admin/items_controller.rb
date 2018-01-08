class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
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
    if params[:retired]
      retire_or_activate("retired")
    elsif params[:active]
      retire_or_activate("active")
    elsif @item.update(item_params)
      flash[:notice] = "#{@item.name} was updated"
      redirect_to item_path(@item)
    else
      @categories = Category.all
      render :edit
    end
  end

  def retire_or_activate(verdict)
    @item.status = verdict
    @item.save
    redirect_to item_path(@item)
  end

  private

    def item_params
      category = Category.find_by(name: params[:item][:category_id])
      permitted_params = params.require(:item).permit(:name, :description, :image, :price, :status)
      permitted_params[:category] = category
      permitted_params
    end

end
