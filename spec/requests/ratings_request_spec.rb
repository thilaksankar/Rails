require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create(content: "Any content to that post", topic_id: @topic.id)
  end
  describe "create a rating" do
    it "should render post new page" do
      sign_in @user
      get "/topics/:topic_id/posts/:post_id/ratings", :params => { :topic_id => @topic.id , :post_id => @post.id }
      expect(response).to render_template(:new)
    end
    it "should create a rataing" do
      sign_in @user
      post "/topics/:topic_id/posts/:post_id/ratings", :params => { :rate => "5", :topic_id => @topic.id , :post_id => @post.id }
    end
  end
end
