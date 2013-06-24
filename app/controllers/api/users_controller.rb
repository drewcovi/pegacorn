module Api
  class UsersController < AuthController
    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      if user.destroy
        render json: user, status: 204
      else
        render json: user
      end
    end

    def update
      user = User.find(params[:id])
      updated = user.update_attributes(
        :email => params[:user][:email],
        :first_name => params[:user][:first_name],
        :last_name => params[:user][:last_name],
        :password => params[:user][:password],
        :ldap => params[:user][:ldap],
        :guts_token => params[:user][:guts_token]
      )
      if updated
        render json: user
      else
        render json: user, status: 422
      end
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

    #before_filter :auth_only!
  end
end
