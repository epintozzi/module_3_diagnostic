require 'rails_helper'

describe "User searches for nearest stations" do
  scenario "a user can search for the 10 nearest alt fuel stations" do
    visit root_path

    fill_in :q, with: "80203"
    click_on "Locate"

    expect(path).to eq("/search") # with params visible in url
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("Fuel Types")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Access Times")
  end
end



# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
