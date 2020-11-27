class ProductsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :set_product,  only: [:edit, :show, :update, :destroy]
  before_action :current_product, only: [:edit, :update, :destroy]
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
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
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

  def current_product
    if @product.user_id != current_user.id 
      redirect_to product_path
    end
  end
end

