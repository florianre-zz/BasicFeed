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
      redirect_to root_path
    else
      flash[:error] = "There was a problem..."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
    flash[:success] = "Successfully deleted post."
  end

private
  def post_params
      params.require(:post).permit(:description)
  end

end
