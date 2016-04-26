require "rails_helper"

RSpec.describe "DELETE /api/v1/items/:id", :type => :request do

  it "gets a 204 response" do
    3.times do |n|
      Item.create(name: "Item ##{n}", description: "All those things #{n} times", image_url: "http://media.mydogspace.com.s3.amazonaws.com/wp-content/uploads/2013/08/puppy-500x350.jpg")
    end
    item = Item.last

    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq 204
  end

end
