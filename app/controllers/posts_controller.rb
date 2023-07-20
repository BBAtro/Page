class PostsController < ApplicationController

  before_action :set_posts!, only: %i[show destroy edit update]

  def index
    # @posts = Post.order(created_at: :desc)

    @posts = Post.search(params[:search]).order(created_at: :desc)

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

  def edit
  end

  def update
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = @post.decorate
    # @comment = @post.comments.build
    # @comments = @post.comments.order(created_at: :desc) #будет выдавать все комменты привязаные к определленному посту
    # @comments = @comments.decorate
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) #из присланных параметров post достать параметры title и body
  end

  def set_posts!
    @post = Post.find(params[:id])
  end
end