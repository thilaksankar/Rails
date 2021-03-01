require 'rails_helper'

RSpec.describe Tag, type: :model do
  before(:each) do
    @tag = Tag.create!(tag: "Sports, Entertainment")
  end
  describe "creation " do
    it "should have a post" do
      expect(Tag.all.count).to eq(1)
    end
  end
end
