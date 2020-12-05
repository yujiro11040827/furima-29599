class BuysController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to  user_session_path
    end
    @product = Product.find(params[:product_id])
    @buy_destination = BuyDestination.new
  end

  def create
    @product = Product.find(params[:product_id])
    @buy_destination = BuyDestination.new(buy_params)
    if @buy_destination.valid?
       @buy_destination.save
       redirect_to products_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_destination).permit(:postal_code, :shipment_source_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, product_id: params[:product_id])
  end

end
