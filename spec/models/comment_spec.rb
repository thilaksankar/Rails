require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @topic = Topic.create!(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create!(content: "First project", topic_id:@topic.id)
    @comment = Comment.create!(comment: "Any Comments", topic_id:@topic.id, post_id:@post.id)
  end
  describe "creation " do
    it "should have a post" do
      expect(Comment.all.count).to eq(1)
    end
  end
end
