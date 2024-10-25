class BuysController < ApplicationController
  before_action :set_item, only: [:index, :new]
  def index
  end

  def new
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_form).permit(
      :post_code, :prefecture_id, :municipality,
      :street_address, :building_name, :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
