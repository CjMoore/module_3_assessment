require "rails_helper"

describe "when user inputs a zip into the search bar" do
  it "they are taken to /search and see a list of stores with their information" do
    zip = "80202"

    visit root_path

    fill_in :search, with: zip
    VCR.use_cassette("/services/find_stores") do
      click_on "Search"
    end

    expect(current_path).to eq("/search")
    expect(page).to have_content("16 Total Stores")
    within(".table") do
      expect(page).to have_content("Name")
      expect(page).to have_content("City")
      expect(page).to have_content("Distance")
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("BEST BUY - SOUTHGLENN")
    end
  end
end
