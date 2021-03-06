class CategoriesController < ApplicationController
  before_action :authenticate_user
  before_action :set_categories, only: [:index, :create, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks

  # GET /categories
  # GET /categories.json
  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    render :show_form
  end

  # GET /categories/1/edit
  def edit
    render :show_form
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.js { render :hide_form }
      else
        format.js { render :show_form }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update    
    respond_to do |format|
      if @category.update(category_params)
        format.js { render :hide_form }
      else
        format.js { render :show_form }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Get all categories
    def set_categories
      @categories = Category.where(user: current_user).search(params[:term])
    end

    # Get all tasks
    def set_tasks
      @tasks = Task.where(user: current_user).search(params[:term])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :term, :task_ids => [])
    end

    # Authenticate user then show content
    def authenticate_user
      if !current_user
          redirect_to login_path
      end
    end
end
