require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = @topic.Post.create!(content: "Any contentss")
  end
  describe "creation" do
    it "should have a content" do
      expect(Post.all.count).to eq(1)
    end
  end
end
