class TasksController < ApplicationController
  before_action :set_list

  def index
    @tasks = Task.includes(list: :user).where(completed: false)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @task = @list.tasks.find(params[:id])
    @task.completed = !@task.completed

    @task.save

    redirect_to list_path(@list)
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy

    redirect_to @list
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end
