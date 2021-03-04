class PostsController < ApplicationController
  def new
    @posts = Post.all
  end
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
  end
  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end
  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @topic
    else
      render :edit
    end
  end
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.create(post_params)
    if @post.save
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Should have all the fields"
      redirect_to topic_path(@topic)
    end
  end
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id]) 
    @post.destroy
    redirect_to topic_path(@topic)
  end
  private
  def post_params
    params.require(:post).permit(:content, :image, :tag)
  end
end
