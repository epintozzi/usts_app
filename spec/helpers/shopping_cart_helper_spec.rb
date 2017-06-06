require "rails_helper"

describe "shopping cart helper" do
  it "returns count of unpaid race registrations for a user" do
    user = create(:user)
    race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_2 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_3 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)

    create(:race_registration, creator_id: user.id, race_id: race_1.id, paid: false)
    create(:race_registration, creator_id: user.id, race_id: race_2.id, paid: false)
    create(:race_registration, creator_id: user.id, race_id: race_3.id, paid: true)

    expect(helper.unpaid_race_reg_count(user)).to eq(2)
  end

  it "returns count of unpaid usts registrations for a user" do
    user = create(:user)

    create(:usts_registration, creator_id: user.id, paid: false, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: false, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: true, race_year: Date.today.year)


    expect(helper.unpaid_usts_reg_count(user)).to eq(2)
  end

  it "returns to count of all unpaid race and usts regs for a user" do
    user = create(:user)
    race_1 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_2 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)
    race_3 = create(:race, start_date: Date.tomorrow, end_date: Date.tomorrow)

    create(:race_registration, creator_id: user.id, race_id: race_1.id, paid: false)
    create(:race_registration, creator_id: user.id, race_id: race_2.id, paid: false)
    create(:race_registration, creator_id: user.id, race_id: race_3.id, paid: true)

    create(:usts_registration, creator_id: user.id, paid: false, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: false, race_year: Date.today.year)
    create(:usts_registration, creator_id: user.id, paid: true, race_year: Date.today.year)

    expect(helper.total_upaid_reg(user)).to eq(4)
  end
end
