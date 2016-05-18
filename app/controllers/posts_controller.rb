class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new
  end

  def create
    @post=Post.create(post_params)
    redirect_to posts_path
    @post.user = current_user
    @post.save
  end

  def post_params
    params.require(:post).permit!
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update_attributes(case_params)
          format.html { redirect_to posts_path }
          format.js
      else
          render 'edit'
      end
  end

end
