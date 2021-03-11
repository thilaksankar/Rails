require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "post request" do
    post = Post.create(content: "Testing purpose")
    get topic_post_path
    expect(response).to be_successful
    expect(response.body).to include("Testing")
  end
end
