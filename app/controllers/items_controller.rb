class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
    # furimaのindexアクション内ではusersテーブルにアクセスせず、N+1問題が発生しないため,@items = Item.includes(:user).order('created_at DESC')より上記となる。

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def show
    @item = Item.find(params[:id])
  end




  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
