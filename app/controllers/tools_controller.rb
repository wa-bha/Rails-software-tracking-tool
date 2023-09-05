class ToolsController < ApplicationController
  def index
    @tools = Tool.includes(:users, :category).all
  end

  def show
    @tool = Tool.includes(:users, :category).find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      redirect_to tools_path, notice: "Tool was successfully created."
    else
      render :new
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @category.destroy

    redirect_to tools_path, notice: "Tool was successfully deleted."
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category_id, user_ids: [])
  end
end
