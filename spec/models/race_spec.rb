require 'rails_helper'

RSpec.describe Race, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without city" do
        race = Race.new(state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57", title: "Race title")

        expect(race).to be_invalid
      end
      it "is invalid without title" do
        race = Race.new(city: "DePue", state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57")

        expect(race).to be_invalid
      end
      it "is invalid without state" do
        race = Race.new(city: "DePue", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57", title: "Race title")

        expect(race).to be_invalid
      end
      it "is invalid without start date" do
        race = Race.new(state: "IL", city: "DePue", end_date: "2017-07-30 16:33:57", title: "Race title")

        expect(race).to be_invalid
      end
      it "is invalid without end date" do
        race = Race.new(state: "IL", city: "DePue", start_date: "2017-07-30 16:33:57", title: "Race title")

        expect(race).to be_invalid
      end
      xit "is invalid if start_date is in the past" do

      end
      xit "is invalid if end_date is in the past" do

      end
      xit "is invalid if end_date is before start_date" do

      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        race = Race.new(title: "National Championships", street_address: "123 Lake St", city: "DePue", state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57", details: "details go here", fee_override: 50, latitude: 89.1234, longitude: 40.1234, hotel_information: "hotel info here")

        expect(race).to be_valid
      end
      it "is valid with all required attributes" do
        race = Race.new(city: "DePue", state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57", title: "Race title")

        expect(race).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many race registrations" do
      race = create(:race)
      expect(race).to respond_to(:race_registrations)
    end
    it "has many race results" do
      race = create(:race)
      expect(race).to respond_to(:race_results)
    end
  end

  describe "model methods" do
    it "generates a list of races' ids with title and location" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL")
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL")

      list = Race.title_location_list
      count = Race.title_location_list.count

      expect(list).to include(["Race for the Kids - Lake Alfred, FL", race_1.id])
      expect(list).to include(["Nationals - DePue, IL", race_2.id])
      expect(count).to eq(2)
    end
    it "scopes races to future date" do
      create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.tomorrow, end_date: Date.tomorrow)

      future_races = Race.future

      expect(future_races).to eq([race_2])
    end
    it "scopes races as registerable" do
      create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.today+4, end_date: Date.today+5)
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.today+6, end_date: Date.today+7)
      create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.today, end_date: Date.today)

      registerable_races = Race.registerable

      expect(registerable_races).to eq([race_2])
    end
    it "scopes races as this year" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.today, end_date: Date.tomorrow)
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.today.next_year, end_date: Date.tomorrow.next_year)

      this_year = Race.races_this_year
      all_races = Race.all

      expect(this_year).to eq([race_1])
      expect(all_races).to include(race_1)
      expect(all_races).to include(race_2)
    end
    it "identifies races as future" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.yesterday, end_date: Date.today)
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.tomorrow, end_date: Date.tomorrow)

      expect(race_1.future?).to eq(false)
      expect(race_2.future?).to eq(true)
    end
    it "identifies races as registerable" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: Date.today+4, end_date: Date.today+5)
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.today+6, end_date: Date.today+7)
      race_3 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: Date.today, end_date: Date.today)

      expect(race_1.registerable?).to eq(false)
      expect(race_2.registerable?).to eq(true)
      expect(race_3.registerable?).to eq(false)
    end
    it "identifies races as this year" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: '2027-12-21', end_date: '2027-12-23')

      expect(race_1.race_this_year?).to eq(true)
      expect(race_2.race_this_year?).to eq(false)
    end
  end

  describe "paranoia" do
    it "soft deletes a race" do
      race = create(:race)

      expect(Race.all).to include(race)

      race.destroy

      expect(Race.all).to_not include(race)
      expect(Race.only_deleted).to include(race)
      expect(race.deleted_at).to_not eq(nil)
    end
    it "restores a soft deleted race" do
      race = create(:race)

      race.destroy

      expect(Race.all).to_not include(race)

      race.restore

      expect(Race.all).to include(race)
    end
  end
end
