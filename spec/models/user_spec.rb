require "rails_helper"

RSpec.describe User, type: :model do
  let :user { FactoryGirl.build :user }

  context "new user" do
    it "should be valid" do
      expect(user).to be_valid
    end
  end

  describe User do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it "name should not be too long" do
      user.name = "a" * 51
      expect(user).to_not be_valid
    end
    it "email should not be too long" do
      user.email = "a" * 244 + "@example.com"
      expect(user).to_not be_valid
    end
  end
end
