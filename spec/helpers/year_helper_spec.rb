require "rails_helper"

describe "race date helper" do
  it "returns the current year if there are future races on the schedule" do
    create(:race, start_date: Date.tomorrow)

    default_reg_year = helper.default_year
    expect(default_reg_year).to eq(Date.current.year)
  end
  it "returns the current year if there are future races on the schedule this year and next year" do
    create(:race, start_date: Date.today)
    create(:race, start_date: Date.today + 1.year)

    default_reg_year = helper.default_year
    expect(default_reg_year).to eq(Date.current.year)
  end
  it "returns the next year if there are future races on the schedule but not in this year" do
    create(:race, start_date: Date.today + 1.year)

    default_reg_year = helper.default_year
    expect(default_reg_year).to eq(Date.current.next_year.year)
  end
end
