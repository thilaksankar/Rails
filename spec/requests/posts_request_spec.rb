require 'rails_helper'

RSpec.describe "Posts", type: :request do
  it "creates a post and redirects to topic show" do
    get "topics/:topic_id/posts/new"
    expect(response).to render_template(:new)

    post "/posts", :post => {:content => "Any content to be added"}
    expect(response).to redirect_to(assign(:widget))
    follow_redirect!
  end
end
