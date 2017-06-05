require "rails_helper"

describe "race date helper" do
  it "formats long race date to month day year" do
    race = create(:race, start_date: '2017-04-21')

    formatted_date = helper.long_race_date(race.start_date)

    expect(formatted_date).to eq("Apr 21, 2017")
  end
  it "formats short race date to month day" do
    race = create(:race, start_date: '2017-04-21')

    formatted_date = helper.short_race_date(race.start_date)

    expect(formatted_date).to eq("Apr 21")
  end
end
