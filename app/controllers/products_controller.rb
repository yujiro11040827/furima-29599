class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    if
    Product.create(product_params)
      redirect_to products_path
    else
      render :index
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :genre_id, :price, :status_id, :shipment_charge_id, :shipment_source_id, :date_shipment_id, :explanation).merge(user_id: current_user.id)
  end
end
