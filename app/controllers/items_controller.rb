class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    redirect_to items_path, notice: 'File uploaded' if @item.save
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:item).permit(:title, :content)
    end
end
