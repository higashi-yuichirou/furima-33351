class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    binding.pry
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area, :city_number, :city, :building_name, :phone_number).merge(user_id: current_user.id, list_id:params[:list_id], token: params[:token])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def move_to_index
    if current_user.id == @list.user_id or @list.purchase.present?
        redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:        List.find(params[:list_id]).price,
      card:          purchase_params[:token],
      currency:      'jpy'
    )
  end
end
