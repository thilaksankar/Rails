require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "validation" do
    it {should validate_presence_of :rate}
  end

end
