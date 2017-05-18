require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "has a name" do
        gallery = Gallery.create(name: "")

        expect(gallery).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        gallery = Gallery.create(name: "Gallery Name")

        expect(gallery).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many photos" do
      gallery = create(:gallery)
      expect(gallery).to respond_to(:photos)
    end
  end
end
