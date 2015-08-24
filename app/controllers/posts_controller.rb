class PostsController < ApplicationController
 respond_to :js
  
  def index
   @post = Post.all_publish()
  end
  def myindex
   @post = current_user.posts()
  end
  
  def new
   @post = Post.new
  end
  
  def show
    @post = Post.friendly.find(params[:id])
  end
  
  def edit
   @post = Post.friendly.find(params[:id])
  end
  
  def create
   @post = current_user.posts.new(post_params)
   @post.save
   redirect_to @post
  end

  def update
    @post = Post.friendly.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
     else
      render 'edit'
    end
  end

  def destroy
   @post = Post.friendly.find params[:id]
   title = @post.title
   @post.destroy
   redirect_to posts_path, :notice => "Your post has been deleted"
  end

 private
  def post_params
    params.require(:post).permit(:title, :description,:image,:publish)
  end 


end
