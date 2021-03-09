require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe "title validation" do
    it {should validate_presence_of :title}
  end

  describe "post validation" do
     it {should validate_presence_of :post}
     it {should validate_length_of(:post).is_at_least(10)}
  end

  it "for creating a topic" do
    topic = Topic.new(title: "Sports", post: "Any thing of 10 char").save
    expect(topic).to eq(true)
  end

end
