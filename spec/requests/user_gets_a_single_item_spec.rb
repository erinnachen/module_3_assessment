require "rails_helper"

RSpec.describe "GET /api/v1/items/:id", :type => :request do

  it "gets a single item, only containing name, description, image_url" do
    3.times do |n|
      Item.create(name: "Item ##{n}", description: "All those things #{n} times", image_url: "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg")
    end
    item = Item.last

    get "/api/v1/items/#{item.id}"

    expect(response.status).to eq 200
    item_info = JSON.parse(response.body, symbolize_names: true)[:item]

    expect(item_info[:name]).to eq "Item #2"
    expect(item_info[:description]).to eq "All those things 2 times"
    expect(item_info[:image_url]).to eq "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end

end
