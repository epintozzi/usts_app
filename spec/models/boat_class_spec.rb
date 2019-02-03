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

  describe "relationships" do
    it "has many race registrations" do
      boat_class = create(:boat_class)

      expect(boat_class).to respond_to(:race_registrations)
    end
    it "has many race results" do
      boat_class = create(:boat_class)

      expect(boat_class).to respond_to(:race_results)
    end
  end

  describe "paranoia" do
    it "soft deletes a boat_class" do
      boat_class = create(:boat_class)

      expect(BoatClass.all).to include(boat_class)

      boat_class.destroy

      expect(BoatClass.all).to_not include(boat_class)
      expect(BoatClass.only_deleted).to include(boat_class)
      expect(boat_class.deleted_at).to_not eq(nil)
    end
    it "restores a soft deleted boat_class" do
      boat_class = create(:boat_class)

      boat_class.destroy

      expect(BoatClass.all).to_not include(boat_class)

      boat_class.restore

      expect(BoatClass.all).to include(boat_class)
    end

    it 'does not delete a registration when associated with existing Race' do
      boat_class = create(:boat_class)
      create(:race_registration, boat_class_id: boat_class.id)

      boat_class.destroy

      expect(BoatClass.all).to include(boat_class)
    end
  end
end
