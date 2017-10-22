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
        race_reg = RaceRegistration.new(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 2, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)

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
        race_reg_1 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 2, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_2 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 2, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_3 = RaceRegistration.create(boat_class: boat_class_2, usts_registration: usts_registration, race: race, boat_number: "V26", paid: 2, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)
        race_reg_4 = RaceRegistration.create(boat_class: boat_class, usts_registration: usts_registration_2, race: race, boat_number: "V26", paid: 2, boat_owner: "Erin", boat_owner_zip: "80216", boat_name: "Fast Flyer", emergency_contact: "Brad Barth", emergency_phone: "9876544321", emergency_contact_at_race: 1, creator_id: user.id)

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

  describe "model methods" do
    it "scopes race reg to a user" do
      user = create(:user)
      reg_1 = create(:race_registration, creator_id: user.id)
      reg_2 = create(:race_registration)

      all_reg = RaceRegistration.all

      expect(RaceRegistration.for_user(user)). to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes race reg to upaid registrations" do
      reg_1 = create(:race_registration, paid: 0)
      reg_2 = create(:race_registration, paid: 2)

      unpaid_reg = RaceRegistration.unpaid_registrations
      all_reg = RaceRegistration.all

      expect(unpaid_reg).to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes race reg to future races date registrations" do
      race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
      race_2 = create(:race, start_date: Date.today - 2, end_date: Date.today - 2)
      reg_1 = create(:race_registration, race_id: race_1.id)
      reg_2 = create(:race_registration, race_id: race_2.id)

      future_reg = RaceRegistration.for_future_races

      all_reg = RaceRegistration.all

      expect(future_reg).to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes race reg to past race date registrations" do
      race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
      race_2 = create(:race, start_date: Date.today - 2, end_date: Date.today - 2)
      reg_1 = create(:race_registration, race_id: race_1.id)
      reg_2 = create(:race_registration, race_id: race_2.id)

      past_reg = RaceRegistration.for_past_races

      all_reg = RaceRegistration.all

      expect(past_reg).to eq([reg_2])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes race reg to races registrations dates this year" do
      race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
      race_2 = create(:race, start_date: Date.today - 2, end_date: Date.today - 2)
      race_3 = create(:race, start_date: "2017-06-13", end_date: "2017-06-15")
      reg_1 = create(:race_registration, race_id: race_1.id)
      reg_2 = create(:race_registration, race_id: race_2.id)
      reg_3 = create(:race_registration, race_id: race_3.id)

      this_year = RaceRegistration.for_races_this_year

      all_reg = RaceRegistration.all

      expect(this_year).to include(reg_1)
      expect(this_year).to include(reg_2)
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
      expect(all_reg).to include(reg_3)
    end

    it "generates collection of unpaid registrations for a user for race dates in the future" do
      user = create(:user)
      race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
      race_2 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
      race_3 = create(:race, start_date: Date.today - 2, end_date: Date.today - 2)
      race_4 = create(:race, start_date: Date.today - 2, end_date: Date.today - 2)

      reg_1 = create(:race_registration, creator_id: user.id, race_id: race_1.id, paid: 2)
      reg_2 = create(:race_registration, creator_id: user.id, race_id: race_2.id, paid: 0)
      reg_3 = create(:race_registration, creator_id: user.id, race_id: race_3.id, paid: 0)
      reg_4 = create(:race_registration, race_id: race_4.id, paid: 2)

      user_unpaid_this_year = RaceRegistration.unpaid_race_reg(user)

      all_reg = RaceRegistration.all

      expect(user_unpaid_this_year).to eq([reg_2])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
      expect(all_reg).to include(reg_3)
      expect(all_reg).to include(reg_4)
    end

    it "returns correct override fee for KPro" do
      boat_class_1 = create(:boat_class, class_name: "KPro", registration_fee: 15)
      boat_class_2 = create(:boat_class, class_name: "125cc Hydro", registration_fee: 50)
      race_1 = create(:race, fee_override: nil)
      race_2 = create(:race, fee_override: 75)

      race_reg_1 = create(:race_registration, race_id: race_1.id, boat_class_id: boat_class_1.id)
      race_reg_2 = create(:race_registration, race_id: race_2.id, boat_class_id: boat_class_1.id)

      expect(race_reg_1.race_fee_override).to eq(15)
      expect(race_reg_2.race_fee_override).to eq(25)
    end

    it "returns correct override fee for non-KPro classes" do
      boat_class_1 = create(:boat_class, class_name: "KPro", registration_fee: 15)
      boat_class_2 = create(:boat_class, class_name: "125cc Hydro", registration_fee: 50)
      race_1 = create(:race, fee_override: nil)
      race_2 = create(:race, fee_override: 75)

      race_reg_1 = create(:race_registration, race_id: race_1.id, boat_class_id: boat_class_2.id)
      race_reg_2 = create(:race_registration, race_id: race_2.id, boat_class_id: boat_class_2.id)

      expect(race_reg_1.race_fee_override).to eq(50)
      expect(race_reg_2.race_fee_override).to eq(75)
    end
  end

  describe "paranoia" do
    it "soft deletes a race registration" do
      reg = create(:race_registration)

      expect(RaceRegistration.all).to include(reg)

      reg.destroy

      expect(RaceRegistration.all).to_not include(reg)
      expect(RaceRegistration.only_deleted).to include(reg)
      expect(reg.deleted_at).to_not eq(nil)
    end
    it "restores a soft deleted race reg" do
      reg = create(:race_registration)

      reg.destroy

      expect(RaceRegistration.all).to_not include(reg)

      reg.restore

      expect(RaceRegistration.all).to include(reg)
    end
  end
end
