require "rails_helper"

describe BestBuyService do
  describe "#find_stores" do
    it "returns an array of stores retrieved from the bestbuy api" do
      VCR.use_cassette("/services/find_stores") do
        serv = BestBuyService.new
        return_data = serv.find_stores("80202")
        stores = return_data[:stores]
        store = stores.first
        total = return_data[:total]


        expect(total).to eq(16)
        expect(stores.count).to eq(10)
        expect(store.keys).to include(:name)
        expect(store.keys).to include(:city)
        expect(store.keys).to include(:distance)
        expect(store.keys).to include(:phone)
        expect(store.keys).to include(:storeType)
      end
    end
  end
end
