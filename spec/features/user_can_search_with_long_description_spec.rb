require 'rails_helper'

RSpec.feature "User searches from the root page with involved description", :type => :feature do
  scenario "sees results" do
    VCR.use_cassette "search#index_by_description white headphones" do
      visit '/'
      fill_in "search[description]", with: "sennheiser headphones white"
      click_on "search"

      expect(current_path).to eq "/search"
      within(".results") do
        skus = [9068191, 9068155, 9068182, 9068004, 9068013, 9068128]
        skus.each do |sku|
          expect(page).to have_content "SKU: #{sku}"
        end
      end
      expect(page).to_not have_css "#result-7"
    end
  end
end
