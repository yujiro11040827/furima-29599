class BuysController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to  user_session_path
    end
    @product = Product.find(params[:product_id])
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:user_id).permit(:products_id)
  end

end
