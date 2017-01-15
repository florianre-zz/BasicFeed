class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Success!"
      redirect_to request.referrer
    else
      flash[:error] = "There was a problem..."
    end
  end

private
  def post_params
      params.require(:post).permit(:description)
  end

end
