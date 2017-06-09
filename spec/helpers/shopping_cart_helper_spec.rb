require "rails_helper"

describe "shopping cart helper" do
  it "returns count of unpaid race registrations for a user" do
    user = create(:user)
    race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_2 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_3 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)

    create(:race_registration, creator_id: user.id, race_id: race_1.id, paid: 0)
    create(:race_registration, creator_id: user.id, race_id: race_2.id, paid: 0)
    create(:race_registration, creator_id: user.id, race_id: race_3.id, paid: 2)

    expect(helper.unpaid_race_reg_count(user)).to eq(2)
  end

  it "returns count of unpaid usts registrations for a user" do
    user = create(:user)

    create(:usts_registration, creator_id: user.id, paid: 0, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: 0, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: 2, race_year: Date.today.year)


    expect(helper.unpaid_usts_reg_count(user)).to eq(2)
  end

  it "returns to count of all unpaid race and usts regs for a user" do
    user = create(:user)
    race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_2 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_3 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)

    create(:race_registration, creator_id: user.id, race_id: race_1.id, paid: 0)
    create(:race_registration, creator_id: user.id, race_id: race_2.id, paid: 0)
    create(:race_registration, creator_id: user.id, race_id: race_3.id, paid: 2)

    create(:usts_registration, creator_id: user.id, paid: 0, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: 0, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: 2, race_year: Date.today.year)

    expect(helper.total_upaid_reg(user)).to eq(4)
  end
end
