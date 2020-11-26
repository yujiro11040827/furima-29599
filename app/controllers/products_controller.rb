class ProductsController < ApplicationController
  before_action :move_to_signed_in, except: :index
  before_action :set_product,  only: [:edit, :show, :update]
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
  end

  def edit
    if @product.user_id != current_user.id 
       redirect_to products_path
    end
  end

  def update
    if @product.user_id != current_user.id 
       redirect_to product_path
    end
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
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

  def set_product
    @product = Product.find(params[:id])
  end
end

