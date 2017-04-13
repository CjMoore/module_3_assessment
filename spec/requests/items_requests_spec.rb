require "rails_helper"


describe "get index" do
  it "when user requests get at /api/v1/items they are returned a list of all items" do
    item1 = Item.create(name: "item1", description: "its a thing", image_url: "http://www.fillmurray.com/200/300")
    item2 = Item.create(name: "item2", description: "its another thing", image_url: "http://www.fillmurray.com/200/300")

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = JSON.parse(response.body).first

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
    expect(item["name"]).to eq(item1.name)
    expect(item["description"]).to eq(item1.description)
    expect(item["image_url"]).to eq(item1.image_url)
    expect(item["created_at"]).to be_falsy
    expect(item["updated_at"]).to be_falsy
  end
end

describe "get show" do
  it "when user visits /api/v1/items/:id they are returned the data for that item" do
    item1 = Item.create(name: "item1", description: "its a thing", image_url: "http://www.fillmurray.com/200/300")
    item2 = Item.create(name: "item2", description: "its another thing", image_url: "http://www.fillmurray.com/200/300")

    get "/api/v1/items/#{item1.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item["name"]).to eq(item1.name)
    expect(item["image_url"]).to eq(item1.image_url)
    expect(item["description"]).to eq(item1.description)
    expect(item["name"]).to_not eq(item2.name)
    expect(item["created_at"]).to be_falsy
    expect(item["updated_at"]).to be_falsy
  end
end

describe "delete item" do
  it "a user can delete item by sending a delete request to /api/v1/items/:id" do
    item1 = Item.create(name: "item1", description: "its a thing", image_url: "http://www.fillmurray.com/200/300")

    expect(Item.all.count).to eq(1)

    delete "/api/v1/items/#{item1.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(Item.all.count).to eq(0)
  end
end

describe "post item" do
  it "a user can create an item with a post request to /api/v1/items" do
    item ={ item: {name: "item1", description: "its a thing" , image_url: "http://www.fillmurray.com/200/300"}}

    expect(Item.all.count).to eq(0)

    post '/api/v1/items', item

    item = Item.all.last

    json_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(Item.all.count).to eq(1)
    expect(item.name).to eq("item1")
    expect(item.description).to eq("its a thing")
    expect(item.image_url).to eq("http://www.fillmurray.com/200/300")
    expect(json_response["name"]).to eq(item.name)
    expect(json_response["created_at"]).to be_falsy
    expect(json_response["updated_at"]).to be_falsy
  end
end
