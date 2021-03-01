class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
  def index
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.topic_id = @topic.id
    if @comment.save
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:notice] = "Comments should not be empty!"
      redirect_to topic_post_path(@topic, @post)
    end
  end
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_post_path(@topic, @post)
  end
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
