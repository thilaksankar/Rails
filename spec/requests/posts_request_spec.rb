require 'rails_helper'

RSpec.describe "Posts", type: :request do
  it "returns the status of HTTP" do
    get post_path
    post new_topic_post_path
    expect(response).to render_template(:new)
  end
end
