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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
        )

        expect(reg).to be_invalid
      end
      it "is invalid without usts_number for racing membership_type" do
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
        membership_type: 1,
        signature: "Erin Pintozzi",
        creator_id: user.id,
        paid: 0
        )

        expect(reg).to be_invalid
      end
      it "is invalid without usts_number for kpro membership_type" do
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
        membership_type: 2,
        signature: "Erin Pintozzi",
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
        )

        expect(reg).to be_invalid
      end
    end

    context "uniqueness" do
      it "is it invalid if usts_number already exists for the same race year for racing membership_type" do
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
        membership_type: 1,
        signature: "Erin Pintozzi",
        creator_id: user.id,
        paid: 0
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
        membership_type: 1,
        signature: "Ryan Barth",
        creator_id: user.id,
        paid: 0
        )

        expect(reg_1).to be_valid
        expect(reg_2).to be_invalid
      end
      it "is it invalid if usts_number already exists for the same race year for kpro membership_type" do
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
        membership_type: 2,
        signature: "Erin Pintozzi",
        creator_id: user.id,
        paid: 0
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
        membership_type: 2,
        signature: "Ryan Barth",
        creator_id: user.id,
        paid: 0
        )

        expect(reg_1).to be_valid
        expect(reg_2).to be_invalid
      end
      it "is it valid if usts_number already exists for the same race year for nonracing membership_type" do
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
        )

        expect(reg_1).to be_valid
        expect(reg_2).to be_valid
      end

      it "is it valid if usts_number already exists in a different race year" do
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
        creator_id: user.id,
        paid: 0
        )
        reg_2 = UstsRegistration.create(
        race_year: 2016,
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
        creator_id: user.id,
        paid: 0
        )

        expect(reg_1).to be_valid
        expect(reg_2).to be_valid
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
        creator_id: user.id,
        paid: 0
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
        creator_id: user.id,
        paid: 0
        )

        expect(reg).to be_valid
      end
      it "is valid without usts_number for nonracing membership_type" do
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
        creator_id: user.id,
        paid: 0
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
    it "generates a list of racing registrants' ids and full names" do
      user_1 = create(:usts_registration, first_name: "Erin", last_name: "Pintozzi", membership_type: 1)
      user_2 = create(:usts_registration, first_name: "Brad", last_name: "Barth", membership_type: 1)

      list = UstsRegistration.full_name_list
      count = UstsRegistration.full_name_list.count

      expect(list).to include(["Erin Pintozzi", user_1.id])
      expect(list).to include(["Brad Barth", user_2.id])
      expect(count).to eq(2)
    end

    it "generates a list of kpro registrants' ids and full names" do
      user_1 = create(:usts_registration, first_name: "Erin", last_name: "Pintozzi", membership_type: 2)
      user_2 = create(:usts_registration, first_name: "Brad", last_name: "Barth", membership_type: 2)

      list = UstsRegistration.full_name_list
      count = UstsRegistration.full_name_list.count

      expect(list).to include(["Erin Pintozzi", user_1.id])
      expect(list).to include(["Brad Barth", user_2.id])
      expect(count).to eq(2)
    end

    it "does not include non-racing members on full_name_list" do
      create(:usts_registration, first_name: "Erin", last_name: "Pintozzi", membership_type: 0)
      user_2 = create(:usts_registration, first_name: "Brad", last_name: "Barth",  membership_type: 1)

      list = UstsRegistration.where(membership_type: "racing").full_name_list
      count = UstsRegistration.where(membership_type: "racing").full_name_list.count

      expect(list).to eq([["Brad Barth", user_2.id]])
      expect(count).to eq(1)
    end

    it "scopes usts reg to a user" do
      user = create(:user)
      reg_1 = create(:usts_registration, creator_id: user.id)
      reg_2 = create(:usts_registration)

      all_reg = UstsRegistration.all

      expect(UstsRegistration.for_user(user)). to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes usts reg to upaid registrations" do
      reg_1 = create(:usts_registration, paid: 0)
      reg_2 = create(:usts_registration, paid: 2)

      unpaid_reg = UstsRegistration.unpaid_registrations
      all_reg = UstsRegistration.all

      expect(unpaid_reg).to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
    end

    it "scopes usts reg to regs for this year" do
      reg_1 = create(:usts_registration, race_year: Date.today.year)
      reg_2 = create(:usts_registration, race_year: Date.today.next_year.year)
      reg_3 = create(:usts_registration, race_year: Date.today.last_year.year)

      this_year = UstsRegistration.usts_registrations_this_year

      all_reg = UstsRegistration.all

      expect(this_year).to eq([reg_1])
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
      expect(all_reg).to include(reg_3)
    end

    it "scope to registrations for this and future years" do

      reg_1 = create(:usts_registration, race_year: Date.today.year)
      reg_2 = create(:usts_registration, race_year: Date.today.next_year.year)
      reg_3 = create(:usts_registration, race_year: Date.today.last_year.year)

      future_reg = UstsRegistration.future_usts_registrations

      all_reg = UstsRegistration.all

      expect(future_reg).to include(reg_1)
      expect(future_reg).to include(reg_2)
      expect(future_reg).to_not include(reg_3)
      expect(all_reg).to include(reg_1)
      expect(all_reg).to include(reg_2)
      expect(all_reg).to include(reg_3)
    end

    it "generates collection of unpaid registrations for a user for this and future years" do
      user = create(:user)
      reg_1 = create(:usts_registration, creator_id: user.id, race_year: Date.today.year, paid: 2)
      reg_2 = create(:usts_registration, creator_id: user.id, race_year: Date.today.year, paid: 0)
      reg_3 = create(:usts_registration, creator_id: user.id, race_year: Date.today.last_year.year, paid: 0)
      reg_7 = create(:usts_registration, creator_id: user.id, race_year: Date.today.next_year.year, paid: 0)
      reg_4 = create(:usts_registration, race_year: Date.today.year, paid: 0)
      reg_5 = create(:usts_registration, race_year: Date.today.last_year.year, paid: 0)
      reg_6 = create(:usts_registration, race_year: Date.today.year, paid: 2)

      user_unpaid_this_future_year = UstsRegistration.unpaid_usts_reg(user)

      all_reg = UstsRegistration.all

      expect(user_unpaid_this_future_year).to include(reg_2)
      expect(user_unpaid_this_future_year).to include(reg_7)
      expect(user_unpaid_this_future_year).to_not include(reg_1)
      expect(user_unpaid_this_future_year).to_not include(reg_3)
      expect(user_unpaid_this_future_year).to_not include(reg_4)
      expect(user_unpaid_this_future_year).to_not include(reg_5)
      expect(user_unpaid_this_future_year).to_not include(reg_6)
    end
  end
end
