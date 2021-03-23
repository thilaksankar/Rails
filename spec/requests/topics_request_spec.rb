require 'rails_helper'

RSpec.describe "Topics", type: :request do
  before do
    post '/users/sign_in'
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
  end
  describe "creating a user to access topic" do
   it "creates a user and sign in" do
    get "/users/sign_up"
     expect(response).to render_template(:new)
    end
    it "create a user" do
     post "/users", :params => {:email => "example@yahoo.com", :password =>"abcdef"}
       expect(response).to have_http_status(:ok)
    end
   it "should create a post" do
     post "/topics", :params => {:title => "Any content to be added", :post => "Any content to be added"}
     get "/topics/show"
     expect(response).to render_template(:show)
   end
   describe "should show all the topics" do
     it "should create a user " do
       get "/users/sign_in"
       expect(response).to render_template(:new)
       post "/users/sign_in", :params => {:email => "example@yahoo.com", :password =>"abcdef"}
       expect(response).to have_http_status(:ok)
     end
   end
  #   it "creates a topic and redirects to topic show" do
  #   get '/topics/new'
  #   expect(response).to render_template(:new)
  # end
    #
    # post "/topics", :params => {:title => "Any content to be added", :post => "Any content to be added"}
    # expect(response).to redirect_to(assigns(:topic))
    # follow_redirect!
  end
end

