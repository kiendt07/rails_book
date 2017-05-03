require 'rails_helper'

RSpec.feature "User", :type => :feature do
  scenario "Create a new user" do
    visit "/signup"

    fill_in "Name", :with => "My Name"
    fill_in "Email", :with => "my@email.com"
    fill_in "Password", with: "123456"

    click_button "Sign Up Now"

    expect(page).to have_text("My Name")
  end
end
