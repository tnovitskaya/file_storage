class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'File uploaded'
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path, notice: 'File updated'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: 'Item was successfully destroyed.'
  end

  def upload_items
  end

  def upload
    @item = Item.new(content: params[:file])
    @item.title = params[:name]
    if @item.save
      head 200
    end
  end

  private
    def find_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :content, :tags)
    end

end
