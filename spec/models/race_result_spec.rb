require 'rails_helper'

RSpec.describe RaceResult, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without boat_class" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, race_id: race.id)

        expect(result).to be_invalid
      end
      it "is invalid without race" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id)

        expect(result).to be_invalid
      end
      it "is invalid without driver name" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(usts_number: '12345', points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_invalid
      end
      it "is invalid without points" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_invalid
      end

      it "is invalid without usts number" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(points: 400, driver_name: "Tucker Doggo", boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        race = create(:race)
        boat_class = create(:boat_class)

        result = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result).to be_valid
      end
    end

    context "uniqueness" do
      it "is invalid if usts_number, race, and class aren't unique" do
        race = create(:race)
        boat_class = create(:boat_class)

        result_1 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        result_2 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class.id, race_id: race.id)

        expect(result_1).to be_valid
        expect(result_2).to be_invalid
      end
      it "is valid if usts_number and class are unique to race" do
        race = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race.id)

        result_2 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_2.id, race_id: race.id)

        expect(result_1).to be_valid
        expect(result_2).to be_valid
      end
      it "is valid if usts_number and race are unique to class" do
        race_1 = create(:race)
        race_2 = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

        result_2 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_2.id)

        expect(result_1).to be_valid
        expect(result_2).to be_valid
      end
      it "is valid if class and race are unique to usts_number" do
        race_1 = create(:race)
        race_2 = create(:race)
        boat_class_1 = create(:boat_class)
        boat_class_2 = create(:boat_class)

        result_1 = RaceResult.create(usts_number: '12345', driver_name: "Tucker Doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

        result_2 = RaceResult.create(usts_number: '45678', driver_name: "Bruce Wayne", points: 400, boat_class_id: boat_class_1.id, race_id: race_1.id)

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
      boat_class_1 = create(:boat_class)
      race = create(:race)
      result = RaceResult.create(usts_number: '12345', driver_name: "TUCKER DOGGO", points: 400, boat_class_id: boat_class_1.id, race_id: race.id)
      expect(result.driver_name).to eq("Tucker Doggo")
    end
    it "formats lowercase name to titlecase" do
      boat_class_1 = create(:boat_class)
      race = create(:race)
      result = RaceResult.create(usts_number: '12345', driver_name: "tucker doggo", points: 400, boat_class_id: boat_class_1.id, race_id: race.id)
      expect(result.driver_name).to eq("Tucker Doggo")
    end
  end

  describe 'update or create by' do
    subject { described_class.update_or_create_by(attributes) }
    let(:boat_class) { create(:boat_class) }
    let(:race) { create(:race) }
    let(:attributes) do
      { 'usts_number' => '12345',
        'driver_name' => 'tucker doggo',
        'points' => 400,
        'boat_class_id' => boat_class.id,
        'race_id' => race.id }
    end
    it 'creates new record' do
      expect { subject }.to change(RaceResult, :count).by(1)
    end
    it 'updates when record already exists' do
      create(:race_result,
             usts_number: '12345',
             boat_class_id: boat_class.id,
             race_id: race.id)
      expect { subject }.to change(RaceResult, :count).by(0)
    end
  end

end
