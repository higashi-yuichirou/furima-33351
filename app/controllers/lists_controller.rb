class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    #@lists = List.all
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:image, :name, :detail, :category_id, :status_id, :shipping_fee_id, :location_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
