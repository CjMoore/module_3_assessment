require "rails_helper"

describe Store do
  context "methods" do
    it "create returns and array of stores with names, cities, distances, phone# and types" do
      stores = { total: 10,
                  stores:  [
                    {longName: "LONG STORE NAME",
                    city: "Denver",
                    distance: 1.5,
                    phone: "555-555-5555",
                    storeType: "BigBox"},

                    {longName: "LONG STORE NAME 2",
                     city: "Denver",
                     distance: 1.5,
                     phone: "555-555-5555",
                     storeType: "BigBox"} ] }

      allow_any_instance_of(BestBuyService).to receive(:find_stores).and_return(stores)

      store_obj = Store.create("80202")

      expect(store_obj.count).to eq(2)
      expect(store_obj.first.name).to eq("LONG STORE NAME")
      expect(store_obj.last.name).to eq("LONG STORE NAME 2")
    end

    it "total returns a total from the data returned from the api" do
      stores = { total: 10 }

      allow_any_instance_of(BestBuyService).to receive(:find_stores).and_return(stores)

      total = Store.total("80202")

      expect(total).to eq(10)
    end
  end
end
