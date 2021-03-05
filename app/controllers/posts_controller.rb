class PostsController < ApplicationController
  before_action :set_post, only: [:index, :show, :update, :create, :destroy]
  def new
    @posts = Post.all
  end
  def index
    @posts = @topic.posts
  end
  def show
    @post = @topic.posts.find(params[:id])
  end
  def update
    @post = @topic.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @topic
    else
      render :edit
    end
  end
  def edit
    @post = @topic.posts.find(params[:id])
  end
  def create
    @post = @topic.posts.create(post_params)
    if @post.save
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Should have all the fields"
      redirect_to topic_path(@topic)
    end
  end
  def destroy
    @post = @topic.posts.find(params[:id]) 
    @post.destroy
    redirect_to topic_path(@topic)
  end
  private
  def post_params
    params.require(:post).permit(:content, :image, :tag)
  end
  def set_post
    @topic = Topic.find(params[:topic_id])
  end
end
