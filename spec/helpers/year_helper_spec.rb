require 'rails_helper'

describe 'race date helper' do
  include ActiveSupport::Testing::TimeHelpers
  context 'future races on the schedule' do
    it 'returns the current year' do
      create(:race, start_date: Date.tomorrow)

      default_reg_year = helper.default_year
      expect(default_reg_year).to eq(Date.current.year)
    end
  end
  context 'future races on the schedule this year and next year' do
    it 'returns the current year' do
      create(:race, start_date: Date.today)
      create(:race, start_date: Date.today + 1.year)

      default_reg_year = helper.default_year
      expect(default_reg_year).to eq(Date.current.year)
    end
  end
  context 'future races on the schedule but not in this year' do
    let(:year) { Date.current.year }
    context 'and it is before Oct 1 of the current year' do
      before do
        travel_to Time.zone.local(year, 02, 24)
      end
      it 'returns the current year' do
        create(:race, start_date: Date.today + 1.year)
        default_reg_year = helper.default_year
        expect(default_reg_year).to eq(Date.current.year)
      end
    end
    context 'and it is after Oct 1 of the current year' do
      before do
        travel_to Time.zone.local(year, 10, 24)
      end
      it 'returns the next year' do
        create(:race, start_date: Date.today + 1.year)

        default_reg_year = helper.default_year
        expect(default_reg_year).to eq(Date.current.next_year.year)
      end
    end
  end
  context 'no future races on the schedule' do
    let(:year) { Date.current.year }
    context 'and it is before Oct 1 of the current year' do
      before do
        travel_to Time.zone.local(year, 02, 24)
      end
      it 'returns the current year' do
        default_reg_year = helper.default_year
        expect(default_reg_year).to eq(Date.current.year)
      end
    end
    context 'and it is after Oct 1 of the current year' do
      before do
        travel_to Time.zone.local(year, 10, 24)
      end
      it 'returns the next year' do
        default_reg_year = helper.default_year
        expect(default_reg_year).to eq(Date.current.next_year.year)
      end
    end
  end
end
