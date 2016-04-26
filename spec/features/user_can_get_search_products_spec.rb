require 'rails_helper'

RSpec.feature "User visits the root page", :type => :feature do
  scenario "see items show page" do
    visit '/'
    fill_in "search[description]", with: "sennheiser"
    click_on "search"

    expect(current_path).to eq "/search"
    within("#result-10") do
      expect(page).to have_content "sku: jjdjfd"
      expect(page).to have_content "name: "
      expect(page).to have_content "customer average review:"
      expect(page).to have_content "short description:"
      expect(page).to have_content "sale price:"
      expect(page).to have_content "image:"
    end
    expect(page).to_not have_css "#result-16"
  end
end
