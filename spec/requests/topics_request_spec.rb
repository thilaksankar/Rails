require 'rails_helper'

RSpec.describe "Topics", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
    @topic = Topic.create(title: "Sports", post: "posts related to topics")
  end
  describe "creating a topic" do
   it "rendering new page", void: true do
     sign_in @user
     get "/topics/new"
     expect(response).to render_template(:new)
   end
   it "should create a topic" do
     sign_in @user
     post "/topics", :params => {:topic => {:title => "Technology", :post => "any content to the post"}}
     expect(response).to redirect_to(assigns(:topic))
     follow_redirect!
     expect(response).to render_template(:show)
     expect(response.body).to include("Topics created Succesfully")
   end
  end
  describe "it should edit and delete a post" do
    it "should edit a post" do
      sign_in @user
      get "/topics/#{@topic.id}/edit", :params => {:topic => {:title => "Technology", :post => "any content to the post"}}
      expect(response).to render_template(:edit)
    end
  end
end


# it "creates a topic and redirects to topic show" do
  #  get '/topics/new'
  #  expect(response).to render_template(:new)
  # end
    #
    # post "/topics", :params => {:title => "Any content to be added", :post => "Any content to be added"}
    # expect(response).to redirect_to(assigns(:topic))
    # follow_redirect!
