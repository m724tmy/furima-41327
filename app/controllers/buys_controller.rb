class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index
  def index
    @buy_form = BuyForm.new
    if @buy_form.present?
      redirect_to root_path
    end
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
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

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end  

end
