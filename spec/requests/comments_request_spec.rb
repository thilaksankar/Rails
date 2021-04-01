require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create(content: "Any content to the post", id: @topic.id)
    @comment = Comment.create(comment: "Comment added", topic_id: @topic.id, id: @post.id)
  end
  describe "comment must be created" do
    it "must render a post" do
      sign_in @user
      get "/topics/#{@topic.id}/posts/#{@post_id}"
      expect(response).to have_http_status(:ok)
    end
    it "must create a comment" do
      sign_in @user
      post "/topics/#{@topic.id}/posts/#{@post.id}/comments", :params => { :comment => "To have a comment to that post"}
      expect(response).to redirect_to(assigns(:show))
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end
end
