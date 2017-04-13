require "rails_helper"

describe "when user inputs a zip into the search bar" do
  it "they are taken to /search and see a list of stores with their information" do
    zip = "80202"

    visit root_path

    fill_in :search, with: zip 
    click_on "Search"

    expect(current_path).to eq("/search")
  end
end
