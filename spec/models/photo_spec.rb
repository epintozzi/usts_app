require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "validations" do
    context "invalid attributes" do
      xit "is invalid without an image" do
        gallery = create(:gallery)
        photo = Photo.create(gallery_id: gallery.id)

        expect(photo).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all required attributes" do
        gallery = create(:gallery)
        photo = Photo.create(image: File.open("#{Rails.root}/app/assets/images/propeller.png"), gallery_id: gallery.id)

        expect(photo).to be_valid
      end
      it "is valid with all attributes" do
        gallery = create(:gallery)
        photo = Photo.create(photographer: "Tucker Dog", caption: "great race", gallery_id: gallery.id, image: File.open("#{Rails.root}/app/assets/images/propeller.png"))

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
