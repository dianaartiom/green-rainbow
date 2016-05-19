class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @post = Post.new
    @posts = Post.all.order("id DESC")

  end

  def create
    # binding.pry
    @post=Post.create(post_params)
    @post.user = current_user
    @post.save
    respond_to do |format|
      # if the response fomat is html, redirect as usual
      format.html { redirect_to posts_path }

      # if the response format is javascript, do something else...
      format.js { }

    end
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
    respond_to do |format|
      format.html { redirect_to posts_path }
      # format.json { head :no_content }
      format.js { }
    end

  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update_attributes(case_params)
          format.html { redirect_to posts_path }

          # format.json { :render @post }
      else
          render 'edit'
      end
  end

  private

     def all_posts
       @tasks = Post.all
     end

end
