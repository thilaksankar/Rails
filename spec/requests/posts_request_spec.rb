require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title")
  end
  describe "after post creation" do
  it "redirects to new" do
   sign_in  @user
   get "/topics/:topic_id/posts/new"
    expect(response).to render_template(:new)
  end
  it "should render show" do
    get "/topics/:topic_id/posts/:id", :params => { :post => {:content => "Post created to the relevent topic", :topic_id => @topic.id} }
    expect(response).to redirect_to(assigns(:post))
    follow_redirect!
    expect(response).to_not render_template(:show)
   end
  end
end
