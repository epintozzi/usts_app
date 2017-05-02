require "rails_helper"

describe "/" do
  scenario "user sees sponsors list on home page" do
    sponsor_1, sponsor_2 = create_list(:sponsor, 2)

    visit root_path

    expect(page).to have_css("img[src*='#{sponsor_1.image}']")
    expect(page).to have_css("img[src*='#{sponsor_2.image}']")
    expect(page).to have_link(href: sponsor_1.url)
    expect(page).to have_link(href: sponsor_2.url)
  end
end
