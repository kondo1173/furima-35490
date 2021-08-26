class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @account_destination = AccountDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @account_destination = AccountDestination.new(account_params)
    if @account_destination.valid?
      Payjp.api_key = 'sk_test_410158a977e130f05dd08142'  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      pay_item
      @account_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def account_params
    params.require(:account_destination).permit(:postal_code, :prefecture_id, :city, :building, :address, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: account_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.account.present?
  end
end
