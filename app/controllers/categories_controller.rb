class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:tools).all
    @categories = @categories.search(params[:search]) if params[:search].present?
  end

  def edit
    @category = Category.includes(:tools).find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category was successfully created."
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.tools.update_all(category_id: nil)
    @category.destroy

    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:name, tool_ids: [])
  end
end
