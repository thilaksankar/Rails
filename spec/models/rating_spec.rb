require 'rails_helper'

RSpec.describe Rating, type: :model do
  before(:each) do
    @topic = Topic.create!(title: "First Project", post: "Any stuffs related to title")
    @post = Post.create!(content: "First project", topic_id:@topic.id)
    @rating = Rating.create!(rate: "Any Comments", topic_id:@topic.id, post_id:@post.id)
  end
  describe "creation " do
    it "should have a post" do
      expect(Rating.all.count).to eq(1)
    end
  end
end
