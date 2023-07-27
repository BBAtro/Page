class PostsController < ApplicationController

  before_action :set_posts!, only: %i[show destroy]
  before_action :fetch_tags, only: %i[new]

  def index
    # @posts = Post.order(created_at: :desc)
    @tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids]

    @posts = Post.all_by_tags(@tags).search(params[:search])

    @posts = @posts.decorate

    # respond_to do |format|
    #   format.html
    # end
  end

  

  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = @post.decorate
    # @comment = @post.comments.build
    @comments = @post.comments.order(created_at: :desc) #будет выдавать все комменты привязаные к определленному посту
    # @comments = @comments.decorate
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tag_ids: []) #из присланных параметров post достать параметры title и body
  end

  def set_posts!
    @post = Post.find(params[:id])
  end

  def fetch_tags
    @tags = Tag.all
  end
end