require "rails_helper"

feature "user creates location", %Q{
  As a user,
  I want to add a new location,
  so that people can learn about it.

  Acceptance Criteria:
  { } A user can create a location, supplying name, description, and address
  { } Once that location is created, it appears in the index list and has a show page
  { } If the user does not supply name, address or descriptino, they receive an error message
  { } Only a user can create a station

  } do
    scenario "user creates a location" do
      admin = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location)
      sign_in_as(user)

      visit new_location_path

      fill_in "Name", with: "Creepy Mansion"
      fill_in "Description", with: "This place is creepy and haunted."
      fill_in "Town", with: "Townville"
      select "MA", from: "State"
      fill_in "Address", with: ""
      select "tiny", from: "Size"

      click_on "Submit"
      expect(page).to have_content("Location created.")
    end

  end
