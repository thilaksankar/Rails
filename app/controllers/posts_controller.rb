class PostsController < ApplicationController
  before_action :set_post, only: [:index, :show, :update, :create, :destroy, :edit]
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token
  def new
    @posts = Post.all
  end
  def index
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    @readpostids = current_user.read_post_ids
  end
  def show
    @post = @topic.posts.find(params[:id])
  end
  def update
    @post = @topic.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to topic_post_path(@topic, @post)
    else
      render :edit
    end
  end
  def edit
    @post = @topic.posts.find(params[:id])
  end
  def create
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:alert] = "Should have all the fields"
      redirect_to topic_posts_path(@topic, @post)
    end
  end
  def destroy
    @post = @topic.posts.find(params[:id])
    @post.user_id = current_user.id
    @post.destroy
    redirect_to topic_posts_path(@topic, @post)
  end
  def mark_post_read
    set_post
    begin
      @post.user_ids = @post.user_ids.append(current_user.id)
      @message = 'Post Marked Read'
    rescue => error
      @message = error.message
    end
    respond_to do |f|
      f.json { render json: @message, status: :ok }
    end
  end

  def show_all
    @topic = Topic.all
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, tag_ids:[], tags_attributes:  [:tag])
  end
  def set_post
    @topic = Topic.find(params[:topic_id])
  end
end
