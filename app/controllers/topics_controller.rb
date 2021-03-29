class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
     if @topic.save
       format.html { redirect_to @topic, success: "Topics created Succesfully" }
       format.js
     else
       format.html { render :new }
     end
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, info: "Topics Updated!"
    else
      render :edit
    end
  end

  def edit
    p topic_params
  end

  def destroy
    @topic.destroy
    redirect_to root_path, warning: "Topic Deleted successfully!!"
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :post, :tag)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
