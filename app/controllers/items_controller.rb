class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :sold_out_item, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :search, :show]


  def index
    @items = Item.order('created_at DESC')
    # 復習時の見返しのためコメント残します
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

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    @item.user_id = current_user.id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.includes(:user)
  end



  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    redirect_to root_path if @item.account.present?
  end


  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end



end
