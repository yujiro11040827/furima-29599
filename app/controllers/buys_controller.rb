class BuysController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to  user_session_path
    end
    @product = Product.find(params[:product_id])
    @buy_destination = BuyDestination.new
  end

  def create
    @buy_destination = BuyDestination.new(buy_params)
    if @buy_destination.valid?
       @buy_destination.save
      return redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_destination).permit(:user_id, :products_id, :buys_id, :postal_code, :shipment_source_id, :city, :address, :building, :phone_number).merge(token: params[:token])
  end

end
