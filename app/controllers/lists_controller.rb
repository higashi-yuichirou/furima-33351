class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :edit
  def index
    @lists = List.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:image, :name, :detail, :category_id, :status_id, :shipping_fee_id, :location_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user == @list.user
  end
end
