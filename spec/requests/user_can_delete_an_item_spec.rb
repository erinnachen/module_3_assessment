require "rails_helper"

RSpec.describe "Items index", :type => :request do

  it "gets all items with their properties but not time-related props" do
    3.times do |n|
      Item.create(name: "Item ##{n}", description: "All those things #{n} times", image_url: "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg")
    end
    item = Item.last

    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq 204

    visit "/items/#{item.id}"
    expect(page).to_not have_content "Item ##{item.id}"
    expect(page).to_not have_content "All those things 2 times"
  end

end
