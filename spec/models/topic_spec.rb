require 'rails_helper'

RSpec.describe Topic, type: :model do
  before(:each) do
    @topic = Topic.create!(title: "First Project", post: "Any stuffs related to title")
  end
  describe "creation " do
    it "should have a post" do
      expect(Topic.all.count).to eq(1)
    end
  end
end
