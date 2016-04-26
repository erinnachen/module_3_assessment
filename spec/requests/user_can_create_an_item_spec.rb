require "rails_helper"

RSpec.describe "POST /api/v1/items/:id", :type => :request do

  it "gets a new item, only containing name, description, image_url" do
    payload = {name: "New Item", description: "Super fun item", image_url:"http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg"}
    post "/api/v1/items", payload.to_json

    expect(response.status).to eq 201
    item_info = JSON.parse(response.body, symbolize_names: true)[:item]

    expect(item_info[:name]).to eq "New Item"
    expect(item_info[:description]).to eq  "Super fun item"
    expect(item_info[:image_url]).to eq "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end

end
