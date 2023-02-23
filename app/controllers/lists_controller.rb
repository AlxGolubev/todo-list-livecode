class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = current_user.lists.find(params[:id])
    @tasks = @list.tasks.order(completed: :desc)
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
