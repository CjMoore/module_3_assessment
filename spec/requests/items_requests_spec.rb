require "rails_helper"


describe "get index" do
  it "when user requests get at /api/v1/items they are returned a list of all items" do
    item1 = Item.create(name: "item1", description: "its a thing")
    item2 = Item.create(name: "item2", description: "its another thing")

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = JSON.parse(response.body).first

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
    expect(item["name"]).to eq("item1")
    expect(item["description"]).to eq("its a thing")
  end
end

describe "get show" do
  it "when user visits /api/v1/items/:id they are returned the data for that item" do
    item1 = Item.create(name: "item1", description: "its a thing")
    item2 = Item.create(name: "item2", description: "its another thing")

    get "/api/v1/items/#{item1.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item["name"]).to eq(item1.name)
    expect(item["description"]).to eq(item1.description)
    expect(item["name"]).to_not eq(item2.name)
  end
end

describe "delete item" do
  it "a user can delete item by sending a delete request to /api/v1/items/:id" do
    item1 = Item.create(name: "item1", description: "its a thing")

    delete "/api/v1/items/#{item1.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(Item.all.count).to eq(0)
  end
end
