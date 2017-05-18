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
  end

  describe "model methods" do
    it "generates a list of races' ids with title and location" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL")
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL")

      list = Race.title_location_list
      count = Race.title_location_list.count

      expect(list).to eq([["Race for the Kids - Lake Alfred, FL", race_1.id], ["Nationals - DePue, IL", race_2.id]])
      expect(count).to eq(2)
    end
    it "scopes races to future date" do
      create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: '2017-12-21', end_date: '2017-12-23')

      list = Race.title_location_list
      count = Race.title_location_list.count

      expect(list).to eq([["Nationals - DePue, IL", race_2.id]])
      expect(count).to eq(1)
    end
    it "identifies races as future" do
      race_1 = create(:race, title: "Race for the Kids", city: "Lake Alfred", state: "FL", start_date: '2017-04-21', end_date: '2017-04-23')
      race_2 = create(:race, title: "Nationals", city: "DePue", state: "IL", start_date: '2017-12-21', end_date: '2017-12-23')

      expect(race_1.future?).to eq(false)
      expect(race_2.future?).to eq(true)
    end
  end
end
