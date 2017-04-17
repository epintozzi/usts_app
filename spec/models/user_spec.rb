require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an email" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", password: "password")

        expect(user).to be_invalid
      end
      it "is invalid without a password" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com")

        expect(user).to be_invalid
      end
      it "is invalid without a first name" do
        user = User.new(last_name: "Pintozzi", email: "erin@email.com", password: "password")

        expect(user).to be_invalid
      end
      it "is invalid without a last name" do
        user = User.new(first_name: "Erin", email: "erin@email.com", password: "password")

        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password")

        expect(user).to be_valid
      end
    end
    context "uniqueness" do
      it "has a unique email" do
        User.create(first_name: "Erin", last_name: "Pintozzi", email: "erin@email.com", password: "password")

        user_2 = User.create(first_name: "Ryan", last_name: "Barth", email: "erin@email.com", password: "password")

        expect(user_2).to be_invalid
      end
    end
  end

  describe "relationships" do

  end
end
