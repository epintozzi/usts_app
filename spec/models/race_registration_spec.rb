require 'rails_helper'

RSpec.describe RaceRegistration, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a boat number" do
        user = create(:user)
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, creator_id: user.id)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a boat class" do
        user = create(:user)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_number: "V26", usts_registration: usts_registration, race: race, creator_id: user.id)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a usts registration" do
        user = create(:user)
        boat_class = create(:boat_class)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, boat_number: "V26", race: race, creator_id: user.id)

        expect(race_reg).to be_invalid
      end
      it "is invalid without a race" do
        user = create(:user)
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, boat_number: "V26", creator_id: user.id)

        expect(race_reg).to be_invalid
      end

    end
    context "valid attributes" do
      it "is valid with all required attributes" do
        user = create(:user)
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", creator_id: user.id)

        expect(race_reg).to be_valid
      end
      it "is valid with all attributes" do
        user = create(:user)
        boat_class = create(:boat_class)
        usts_registration = create(:usts_registration)
        race = create(:race)
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)

        expect(race_reg).to be_valid
      end
    end
    context "uniqueness" do
      it "is invalid for user to register for same race and class" do
        user = create(:user)
        boat_class = create(:boat_class)
        boat_class_2 = create(:boat_class)
        usts_registration = create(:usts_registration)
        usts_registration_2 = create(:usts_registration)
        race = create(:race)
        race_reg_1 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_2 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_3 = RaceRegistration.create(boat_class: boat_class_2, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_4 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration_2, race: race, boat_number: "V26", paid: 1, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)

        expect(race_reg_1).to be_valid
        expect(race_reg_2).to be_invalid
        expect(race_reg_3).to be_valid
        expect(race_reg_4).to be_valid
      end
    end
  end

  describe "relationship" do
    it "belongs to creator" do
      reg = create(:race_registration)
      expect(reg).to respond_to(:creator_id)
    end
  end
end
