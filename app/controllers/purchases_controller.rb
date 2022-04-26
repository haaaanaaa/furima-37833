class PurchasesController < ApplicationController
  def index
    if @product[:user_id] == current_user.id || @product.purchase.present?
      redirect_to root_path
    else
      @purchase = PurchaseAddress.new
    end
  end

end
