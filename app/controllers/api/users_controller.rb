module Api
  class UsersController < AuthController
    # actions :index, :show, :new
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
      # user.update_attributes(params[:user])
      user.update_attributes(
        :email => params[:user][:email],
        :first_name => params[:user][:first_name],
        :last_name => params[:user][:last_name]
      )
      render json: user
    end

    def new
      user = User.new
    end
    
    def create
      user = User.create!(
        :email => params[:user][:email],
        :first_name => params[:user][:first_name],
        :last_name => params[:user][:last_name],
        :password => params[:user][:password]
      )
      render json: user
    end

    before_filter :auth_only!
  end
end
