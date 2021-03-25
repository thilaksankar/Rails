class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end
  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @rating = @post.ratings.find(params[:id])
  end
  def index
    p params
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @ratings = @post.ratings.find(params[:id])
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @rating = @post.ratings.new(rating_params)
    @rating.topic_id = @topic.id
    if @rating.save
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:notice] = "Maximum rating is 5"
      redirect_to topic_post_path(@topic, @post)
    end
  end
  def rating_params
    params.require(:rating).permit(:rate)
  end
end
