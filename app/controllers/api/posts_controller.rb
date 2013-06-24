module Api
  class PostsController < BaseController
    def index
      render json: Post.all
    end

    def show
      render json: Post.find_by_permalink(params[:id])
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      if post.destroy
        render json: post, status: 204
      else
        render json: post
      end
    end

    def update
      post = Post.find(params[:id])
      # post.update_attributes(params[:post])
      updated = post.update_attributes(
        :title => params[:post][:title],
        :body => params[:post][:body],
        :permalink => params[:post][:permalink]
      )
      if updated
        render json: post
      else
        render json: post, status: 422
      end
    end

    def new
      post = Post.new
    end
    
    def create
      post = Post.create!(
        :title => params[:post][:title],
        :body => params[:post][:body],
        :permalink => params[:post][:permalink]
      )
      render json: post
    end
  end
end