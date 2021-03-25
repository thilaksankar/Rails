require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title", user_id: @user.id)
    @post = Post.create(content: "Any content to the post", topic_id: @topic.id, user_id: @user.id)
  end
  describe "comment must be created" do
    it "must render a post" do
      sign_in @user
      get "/topics/:topic_id/posts/:post_id/comments"
      expect(response).to render_template(:new)
    end
    it "must create a comment" do
      post "/topics/:topic_id/posts/:post_id/comments", :params => { :comment => "To have a comment to that post"}
      expect(response).to have_http_status(:ok)
    end
    it "must show the comment" do
      get "/topics/:topic_id/posts/:id", :params => { :topic_id => @topic.id, :id => @post.id  }
      expect(response).to render_template(:show)
    end
  end
end
