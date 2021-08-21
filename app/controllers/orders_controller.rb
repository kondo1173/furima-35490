class OrdersController < ApplicationController

  def index
    @account_destination = AccountDestination.new

    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @account_destination = AccountDestination.new(account_params)
    if @account_destination.valid?
      # pay_item
      @account_destination.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def account_params
    params.require(:account_destination).permit(:postal_code, :prefecture_id, :city, :building, :address, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end
end
