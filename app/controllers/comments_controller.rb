class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :index, :create, :destroy]
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end
  def show
    @comment = @post.comments.find(params[:id])
  end
  def indexr
    @comments = @post.comments.find(params[:id])
  end
  def create
    @comment = @post.comments.new(comment_params)
    @comment.topic_id = @topic.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:notice] = "Comments should not be empty!"
      redirect_to topic_post_path(@topic, @post)
    end
  end
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_post_path(@topic, @post)
  end
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  def set_comment
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
  end
end
