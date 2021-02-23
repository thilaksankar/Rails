require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @topic = Topic.create!(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create!(content: "First project", topic_id:@topic.id)
  end
  describe "creation " do
    it "should have a post" do
      expect(Post.all.count).to eq(1)
    end
  end
end
