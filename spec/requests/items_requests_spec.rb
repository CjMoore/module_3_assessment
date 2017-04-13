require "rails_helper"


describe "get index" do
  it "when user requests get at /api/v1/items they are returned a list of all items" do
    item1 = Item.create(name: "item1", description: "its a thing")
    item2 = Item.create(name: "item2", description: "its another thing")

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = JSON.parse(response.body).first

    expect(items.count).to eq(2)
    expect(item["name"]).to eq("item1")
    expect(item["description"]).to eq("its a thing")
  end
end
