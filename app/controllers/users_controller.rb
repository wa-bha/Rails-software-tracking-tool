class UsersController < ApplicationController
  def index
    @users = User.includes(:tools).all
  end

  def show
    @user = User.includes(:tools).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def user_params
    params.require(:user).permit(:full_name, tool_ids: [])
  end
end
