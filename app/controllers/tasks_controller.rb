class TasksController < ApplicationController
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
  end

  def destroy
  end
end
