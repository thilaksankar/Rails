require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create(content: "Any content to that post", id: @topic.id)
    @rating = Rating.create(rate: "5", id: @topic.id, post_id: @post.id)
  end
  describe "create a rating" do
    it "should render post show page" do
      sign_in @user
      get "/topics/#{@topic.id}/posts/#{@post.id}"
      expect(response).to have_https_status(:ok)
    end
    it "should create a rating" do
      sign_in @user
      post "/topics/#{@topic.id}/posts/#{@post.id}/ratings", :params => { :rate => "5"}
    end
  end
end
