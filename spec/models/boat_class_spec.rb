require 'rails_helper'

RSpec.describe BoatClass, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a class name" do
        boat_class = BoatClass.new(registration_fee: 1.50)

        expect(boat_class).to be_invalid
      end
      it "is invalid without a registration fee" do
        boat_class = BoatClass.new(class_name: "250cc Hydro")

        expect(boat_class).to be_invalid
      end
      it "is invalid without a unique class name" do
        boat_class1 = BoatClass.create(class_name: "250cc Hydro", registration_fee: 1.50)
        boat_class2 = BoatClass.create(class_name: "250cc Hydro", registration_fee: 1.50)

        expect(boat_class1).to be_valid
        expect(boat_class2).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        boat_class = BoatClass.new(class_name: "250cc Hydro", registration_fee: 1.50)

        expect(boat_class).to be_valid
      end
    end
  end
end
