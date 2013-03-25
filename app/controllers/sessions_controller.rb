class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    render json: user
  end

  def destroy
    logout
    render json: user
  end
end
