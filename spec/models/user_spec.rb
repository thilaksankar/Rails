require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(email: "example@gmail.com", password: "password", password_confirmation: "password")
  end
  describe "creation " do
    it "should have a post" do
      expect(User.all.count).to eq(1)
    end
  end
end
