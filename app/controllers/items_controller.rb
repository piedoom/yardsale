class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  wrap_parameters format: [:json]
  before_action :set_json, only: [:create, :update]

  # GET /items
  def index
    cached_items = Item.all
    @items = [cached_items.select { |item| item.use_qr == true }, cached_items.select { |item| item.use_qr == false }]
    render 'items/index'
  end

  # GET /items/1
  def show
    render 'items/show'
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render 'items/create'
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render 'items/update'
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :description, :price_cents, :negotiable, :available, :photo, :use_qr)
    end

    def set_json
      request.format = :json
    end
end
