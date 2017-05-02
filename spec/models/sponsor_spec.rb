require 'rails_helper'

RSpec.describe Sponsor, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        sponsor = Sponsor.create(image: "image.jpg", url: "www.url.com")

        expect(sponsor).to be_invalid
      end
      it "is invalid without an image" do
        sponsor = Sponsor.create(name: "Sponsor name", url: "www.url.com")

        expect(sponsor).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all required attributes" do
        sponsor = Sponsor.create(name: "Sponsor name",image: "image.jpg")

        expect(sponsor).to be_valid
      end
      it "is valid with all attributes" do
        sponsor = Sponsor.create(name: "Sponsor name", url: "www.url.com", image: "image.jpg")

        expect(sponsor).to be_valid
      end
    end
    context "uniqueness" do
      it "is invalid if another sponsor share the same name and url combination" do
        sponsor_1 = Sponsor.create(name: "Sponsor name", url: "www.url.com", image: "image.jpg")
        sponsor_2 = Sponsor.create(name: "Sponsor name", url: "www.url.com", image: "image.jpg")

        expect(sponsor_2).to be_invalid
        expect(sponsor_1).to be_valid
      end
    end
  end
end
