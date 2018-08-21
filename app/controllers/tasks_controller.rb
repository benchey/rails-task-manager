class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @list = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(tasks_params)
    # equivalent to the 2 following lines
    # @task = Task.new(tasks_params)
    # @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
