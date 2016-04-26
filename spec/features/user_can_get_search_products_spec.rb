require 'rails_helper'

RSpec.feature "User searches from the root page", :type => :feature do
  scenario "see results limited to 15 results" do
    VCR.use_cassette "search#index_by_description" do
      visit '/'
      fill_in "search[description]", with: "sennheiser"
      click_on "search"

      expect(current_path).to eq "/search"
      within("#result-9") do
        expect(page).to have_content "Name: Sennheiser - CX 1.00 Earbud Headphones - White"
        expect(page).to have_content "SKU: 9068191"
        expect(page).to have_content "Customer average review: 5.0"
        expect(page).to have_content "Short description: SENNHEISER CX 1.00 Earbud Headphones: Noise-blocking design; dynamic transducer principle; ultrasmall design; 3.5mm connector; 3.9' cable; includes 4 sizes of ear adapters"
        expect(page).to have_content "Sale price: $44.95"
        expect(page).to have_css "img[src='http://img.bbystatic.com/BestBuy_US/images/products/9068/9068191_sa.jpg']"
      end
      expect(page).to_not have_css "#result-16"
    end
  end
end
