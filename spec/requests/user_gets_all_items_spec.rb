require "rails_helper"

RSpec.describe "Items index", :type => :request do

  it "gets all items with their properties but not time-related props" do
    3.times do |n|
      Item.create(name: "Item ##{n}", description: "All those things #{n} times", image_url: "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg")
    end

    get "/api/v1/items"

    expect(response.status).to eq 200
    items_json = JSON.parse(response.body, symbolize_names: true)

    item_info = items_json[1]
    expect(item_info[:name]).to eq "Item #1"
    expect(item_info[:description]).to eq "All those things 1 times"
    expect(item_info[:image_url]).to eq "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end

end
