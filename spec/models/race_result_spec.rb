require 'rails_helper'

RSpec.describe RaceResult, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without boat_class" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(driver_name: "Tucker Doggo", points: 400, race_id: race.id)

        expect(result).to be_invalid
      end
      it "is invalid without race" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id)

        expect(result).to be_invalid
      end
      it "is invalid without driver name" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_invalid
      end
      it "is invalid without points" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(driver_name: "Tucker Doggo", boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_valid
      end
    end

    context "uniqueness" do
      it "is invalid if driver, race, and class aren't unique" do
        race = create(:race)
        boat_class = create(:boat_class)

        result_1 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        result_2 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result_1).to be_valid
        expect(result_2).to be_invalid
      end
      it "is valid if driver and class are unique to race" do
        race = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race.id)

        result_2 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_2.id, race_id: race.id)

        expect(result_1).to be_valid
        expect(result_2).to be_valid
      end
      it "is valid if driver and race are unique to class" do
        race_1 = create(:race)
        race_2 = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

        result_2 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_2.id)

        expect(result_1).to be_valid
        expect(result_2).to be_valid
      end
      it "is valid if class and race are unique to driver" do
        race_1 = create(:race)
        race_2 = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

        result_2 = RaceResult.create(driver_name: "Bruce Wayne", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

        expect(result_1).to be_valid
        expect(result_2).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs_to boat_class" do
      result = create(:race_result)
      expect(result).to respond_to(:boat_class)
    end
    it "belongs_to race" do
      result = create(:race_result)
      expect(result).to respond_to(:race)
    end
  end

  describe "formatting" do
    it "formats uppercase name to titlecase" do
      driver = "ERIN PINTOZZI"
      new_name = RaceResult.new.proper_caps(driver)
      expect(new_name).to eq("Erin Pintozzi")
    end
    it "formats lowercase name to titlecase" do
      driver = "erin pintozzi"
      new_name = RaceResult.new.proper_caps(driver)
      expect(new_name).to eq("Erin Pintozzi")
    end
  end

end
