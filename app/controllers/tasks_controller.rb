class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :all_tasks,only: [:index, :create, :update, :destroy]

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end
  
  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create(task_params)
    @task.save
  end
  
  def update
    @task = Task.update(task_params)
  end
  
  def destroy
    @task.destroy
  end

  private
    def all_tasks
      @tasks = Task.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
