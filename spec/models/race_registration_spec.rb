require 'rails_helper'

RSpec.describe RaceRegistration, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a boat number" do
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a boat class" do
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_number: "V26", usts_registration: usts_registration, race: race)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a usts registration" do
        boat_class = create(:boat_class)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, boat_number: "V26", race: race)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a race" do
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, boat_number: "V26")

        expect(race_reg).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all required attributes" do
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26")

        expect(race_reg).to be_valid
      end
      it "is valid with all attributes" do
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1)

        expect(race_reg).to be_valid
      end
    end
  end
end
