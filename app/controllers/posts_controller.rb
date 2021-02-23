class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
  end
  def show
    @post = Post.find(params[:id])
  end
  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    if @post.update(posts_params)
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
      flash[:notice] = "Must have atleast 10 characters"
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
    params.require(:post).permit(:content)
  end
end
