require 'rails_helper'

RSpec.describe UstsRegistration, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without race_year" do
        user = create(:user)
        reg = UstsRegistration.new(
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid for race year < 4 digits" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 17,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid for race year > 4 digits" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 20017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without first_name" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without last_name" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without usts_number" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without street_address" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without city" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without state" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without zip" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without birthdate" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        zip: "80216",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without liability_release" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid if liability_release is false" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: false,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without membership_type" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
      it "is invalid without signature" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 Main St",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        creator_id: user.id
        )

        expect(reg).to be_invalid
      end
    end

    context "uniqueness" do
      it "is it invalid if usts_number already exists" do
        user = create(:user)
        reg_1 = UstsRegistration.create(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )
        reg_2 = UstsRegistration.create(
        race_year: 2017,
        first_name: "Ryan",
        last_name: "Barth",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Berwyn",
        state: "IL",
        zip: "60402",
        birthdate: "1990-08-12",
        liability_release: true,
        membership_type: 0,
        signature: "Ryan Barth",
        creator_id: user.id
        )

        expect(reg_1).to be_valid
        expect(reg_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all required attributes" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        creator_id: user.id
        )

        expect(reg).to be_valid
      end
      it "is valid with all attributes" do
        user = create(:user)
        reg = UstsRegistration.new(
        race_year: 2017,
        first_name: "Erin",
        last_name: "Pintozzi",
        usts_number: "12345",
        street_address: "123 main st",
        city: "Denver",
        state: "CO",
        zip: "80216",
        birthdate: "1987-09-26",
        liability_release: true,
        membership_type: 0,
        signature: "Erin Pintozzi",
        email: "erin@email.com",
        phone: "123-456-7890",
        fax: "987-654-4321",
        creator_id: user.id
        )

        expect(reg).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to creator" do
      reg = create(:usts_registration)
      expect(reg).to respond_to(:creator)
    end
    it "has many race registrations" do
      reg = create(:usts_registration)
      expect(reg).to respond_to(:race_registrations)
    end
  end

  describe "model methods" do
    it "generates a list of registrants' ids and full names" do
      user_1 = create(:usts_registration, first_name: "Erin", last_name: "Pintozzi")
      user_2 = create(:usts_registration, first_name: "Brad", last_name: "Barth")

      list = UstsRegistration.full_name_list
      count = UstsRegistration.full_name_list.count

      expect(list).to eq([["Erin Pintozzi", user_1.id], ["Brad Barth", user_2.id]])
      expect(count).to eq(2)
    end
  end
end
