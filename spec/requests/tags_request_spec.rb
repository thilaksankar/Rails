require 'rails_helper'

RSpec.describe "Tags", type: :request do
  before do
    @user = User.create(email: "example@yahoo.com", password: "abcdef")
  end
  describe "sign in and create a tag" do
    it "must render new page" do
      sign_in @user
      get "/tags/new"
      expect(response).to render_template(:new)
    end
    it "must create a tag" do
      sign_in @user
      post "/tags", :params => {:tag => {:tag => "entertainment"}}
      expect(response).to redirect_to(topics_path)
    end
  end
end
