require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:each) do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create(id: @topic.id, content: "Any content to the post")
  end
  describe "after topic creation" do
  it "redirects to new" do
   sign_in  @user
   get "/topics/:topic_id/posts/new"
   expect(response).to render_template(:new)
  end
  it "should render show" do
    sign_in @user
    post "/topics/#{@topic.id}/posts", :params => { :post => {:content => "Content to the post"} }
    expect(response).to render_template(assigns(:show))
  end
  it "should edit and redirect" do
    sign_in @user
    p @post.id
    p @post.content
    get "/topics/#{@topic.id}/posts/#{@post.id}/edit", :params => { :post => {:content => "Content to the post"} }
    expect(response).to render_template(assigns(:edit))
    end
  end
end
