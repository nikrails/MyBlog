class CommentsController < ApplicationController
   skip_before_filter :verify_authenticity_token, :only => :create
def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end
  def show
      
    end

  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
   private
    def comment_params
      params.require(:comment).permit(:body)
    end


end