class ProductsController < ApplicationController
  def index
    @products = Product.all
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

  private
  def product_params
    params.require(:product).permit(:name, :image, :genre_id, :price, :status_id, :shipment_charge_id, :shipment_source_id, :date_shipment_id, :explanation).merge(user_id: current_user.id)
  end
end
