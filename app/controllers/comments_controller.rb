class CommentsController < ApplicationController

  before_action :set_post!

  def edit
  end

  def update 
    
  end

  def create
    @comment = @post.comments.build comment_create_params
    @comments = Comment.order(created_at: :desc)

    if @comment.save
      # redirect_to posts_path(@post) 
      render 'posts/show'
    else
      render 'posts/show'
    end
  end

  def destroy
    comment = @post.comments.find params[:id]
    comment.destroy
    redirect_to posts_path(@post)
  end

  private

  def comment_create_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id) #из присланных параметров comment достать параметр body
  end

  def comment_update_params
    params.require(:comment).permit(:body) #из присланных параметров comment достать параметр body
  end

  def set_post!
    @post = Post.find params[:post_id]
  end

end