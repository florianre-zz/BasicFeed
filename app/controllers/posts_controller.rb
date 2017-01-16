class PostsController < ApplicationController
  def new
  end

  def index
    @post = Post.new
    @posts = Post.order("created_at DESC").all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Success!"
    else
      flash[:error] = @post.errors[:description][0]
    end
    redirect_to root_path
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
