require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an image" do
        gallery = create(:gallery)
        photo = Photo.create(photographer: "Tucker Dog", caption: "great race", gallery_id: gallery.id)

        expect(photo).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all required attributes" do
        gallery = create(:gallery)
        photo = Photo.create(image: "http://usts-app-assets.s3.amazonaws.com/sponsors/images/000/000/002/original/depue_mens_club.jpg?1495136989", gallery_id: gallery.id)

        expect(photo).to be_valid
      end
      it "is valid with all attributes" do
        gallery = create(:gallery)
        photo = Photo.create(photographer: "Tucker Dog", caption: "great race", gallery_id: gallery.id, image: "http://usts-app-assets.s3.amazonaws.com/sponsors/images/000/000/002/original/depue_mens_club.jpg?1495136989")

        expect(photo).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a gallery" do
      photo = create(:photo)
      expect(photo).to respond_to(:gallery)
    end
  end
end
