require 'rails_helper'

RSpec.describe Race, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without city" do
        race = Race.new(state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57")

        expect(race).to be_invalid
      end
      it "is invalid without state" do
        race = Race.new(city: "DePue", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57")

        expect(race).to be_invalid
      end
      it "is invalid without start date" do
        race = Race.new(state: "IL", city: "DePue", end_date: "2017-07-30 16:33:57")

        expect(race).to be_invalid
      end
      it "is invalid without end date" do
        race = Race.new(state: "IL", city: "DePue", start_date: "2017-07-30 16:33:57")

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
        race = Race.new(street_address: "123 Lake St", city: "DePue", state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57", sanction: "sanction.pdf", details: "details go here", fee_override: 50, latitude: 89.1234, longitude: 40.1234, hotel_information: "hotel info here")

        expect(race).to be_valid
      end
      it "is valid with all required attributes" do
        race = Race.new(city: "DePue", state: "IL", start_date: "2017-07-26 16:33:57", end_date: "2017-07-30 16:33:57")

        expect(race).to be_valid
      end
    end
  end
end
