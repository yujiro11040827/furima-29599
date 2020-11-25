class ProductsController < ApplicationController
  before_action :move_to_signed_in, except: :index
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :genre_id, :price, :status_id, :shipment_charge_id, :shipment_source_id, :date_shipment_id, :explanation).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  user_session_path
    end
  end
end

