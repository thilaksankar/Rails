require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "content validation" do
    it {should validate_presence_of :content}
    it {should validate_length_of(:content).is_at_least(10)}
  end

  describe "image validation" do
    it {should validate_presence_of :image}
  end

end
