class PostsController < ApplicationController
  
  def create
    @post=Post.create(post_params)
    redirect_to posts_path
    @post.user = current_user
    @post.save
  end  

  def post_params
    params.require(:post).permit!
  end

  def index
  end
  
  def new
    @post = Post.new

  end

end
