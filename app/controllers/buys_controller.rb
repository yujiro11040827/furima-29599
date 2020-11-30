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
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:user_id, :products_id).merge(token: params[:token])
  end

end
