class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
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

    if @tool.destroy
      redirect_to tools_path, notice: "Tool was successfully deleted."
    else
      redirect_to tools_path, alert: "Could not delete tool."
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, user_ids: [])
  end
end
