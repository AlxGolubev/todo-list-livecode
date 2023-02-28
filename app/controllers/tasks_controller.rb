class TasksController < ApplicationController
  before_action :set_list

  def new
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to list_path(@list)
    else
      render :new
    end
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

  def task_params
    params.require(:task).permit(:title)
  end

  def set_list
    @list = current_user.lists.find_by(id: params[:list_id]) || current_user.shared_lists.find_by(id: params[:list_id])

    if @list.nil?
      raise ActiveRecord::RecordNotFound, "Couldn't find List with 'id'=#{params[:list_id]}"
    end
  end
end
