class TopicsController < ApplicationController
  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 10)
  end
  def show
    @topic = Topic.find(params[:id])
  end
  def new
    @topic = Topic.new
  end
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic, success: "Topics created Succesfully"
    else
      render :new
    end
  end
  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, info: "Topics Updated!"
    else
      render :edit
    end
  end
  def edit
    @topic = Topic.find(params[:id])
  end
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to root_path, warning: "Topic Deleted successfully!!"
  end
  private
  def topic_params
    params.require(:topic).permit(:title, :post)
  end
end
