class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]
  before_action :set_tasks, only: [:create, :index, :destroy, :update]
  before_action :set_categories, only: [:index, :new, :edit, :create]

  # GET /tasks
  # GET /tasks.json
  def index
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    render :show_form
  end

  # GET /tasks/1/edit
  def edit
    render :show_form
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.js { render :hide_form }
      else
        format.js { render :show_form }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { render :hide_form }
      else
        format.js { render :show_form }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  # Mark task as completed
  def toggle
    @task.update_attributes(:completed => params[:completed])
    respond_to do |format|
      format.js
    end
  end

  private
    # Get all categories
    def set_categories
      @categories = Category.where(user: current_user)
    end

    # Get all tasks
    def set_tasks
      @tasks = Task.where(user: current_user).search(params[:term])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :due_date, :user, :completed, :term, :category_ids => [])
    end

    # Authenticate user then show content
    def authenticate_user
      if !current_user
          redirect_to login_path
      end
    end
end
