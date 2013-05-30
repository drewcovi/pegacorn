module Api
  class PostsController < BaseController
    def index
      render json: Post.all
    end

    def show
      render json: Post.find(params[:id])
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      render json: post
    end

    def update
      post = Post.find(params[:id])
      # post.update_attributes(params[:post])
      post.update_attributes(
        :title => params[:post][:title],
        :body => params[:post][:body]
      )
      render json: post
    end

    def new
      post = Post.new
    end
    
    def create
      post = Post.create!(
        :title => params[:post][:title],
        :body => params[:post][:body]
      )
      render json: post
    end
  end
end