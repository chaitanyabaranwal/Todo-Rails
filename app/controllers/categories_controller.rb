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
    @category.save

    render :hide_form

    # respond_to do |format|
    #   if @category.save
    #     format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
    #     format.json { render :show, status: :created, location: @category }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category.update(category_params)
    render :hide_form
    
    # respond_to do |format|
    #   if @category.update(category_params)
    #     format.html { redirect_to @category, notice: 'Category was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @category }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Get all categories
    def set_categories
      @categories = Category.where(user: current_user)
    end

    # Get all tasks
    def set_tasks
      @tasks = Task.where(user: current_user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :task_ids => [])
    end

    # Authenticate user then show content
    def authenticate_user
      if !current_user
          redirect_to login_path
      end
    end
end
