require 'rails_helper'

RSpec.feature "User visits the root page", :type => :feature do
  scenario "see items show page" do
    visit '/'
    expect(page.status_code).to eq 200

    within('h1') do
      expect(page).to have_content 'Items'
    end
  end
end
