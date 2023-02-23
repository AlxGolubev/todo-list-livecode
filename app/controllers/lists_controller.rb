class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
end
