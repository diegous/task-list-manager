class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
    @list = List.find_by(slug: params[:list_id])
    @type = params[:type]
  end

  def edit
    @task = @task.becomes(Task)
    @list = List.find_by(slug: params[:list_id])
    @type = @task.type
  end

  def create
    @task = Task.new(task_params)
    @task.list = List.find_by(slug: params[:list_id])
    @task.state = State.find_by(name: 'pending')

    if @task.save
      redirect_to @task.list, notice: 'Task was successfully created.'
    else
      @task = @task.becomes(Task)
      @list = List.find_by(slug: params[:list_id])
      @type = @task.type

      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task.list, notice: 'Task was successfully updated.'
    else
      @task = @task.becomes(Task)
      @list = List.find_by(slug: params[:list_id])
      @type = @task.type

      render :edit
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      redirect_to lists_url, notice: 'List was successfully destroyed.'
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:type, :state, :priority_id, :description, :start_date, :end_date, :percentage)
    end
end
