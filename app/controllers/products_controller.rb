class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @product.user_id == current_user.id && @product.purchase.nil?
    else
      redirect_to root_path
    end
  end

  def update
    @product.update(product_params)
    # バリデーションがOKであれば詳細画面へ
    if @product.valid?
      redirect_to product_path(product_params)
    else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      render 'edit'
    end
  end

  

  private

  def require_login
    redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :derively_fee_id, :status_id, :prefecture_id,
                                    :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
