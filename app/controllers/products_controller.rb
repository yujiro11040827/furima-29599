class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :category_id, :price, :status_id, :shipment_source_id, :date_shipment_id, :explanation).merge(user_id: current_user.id)
  end
end
