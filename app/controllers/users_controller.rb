class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    render json: user
  end

  def new
    user = User.new
  end
  
  def create
    user = User.new(params[:user])
    render json: user
  end
end
