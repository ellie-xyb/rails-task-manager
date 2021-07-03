# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[read edit update destroy]

  def index
    @tasks = Task.all
  end

  def read; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
