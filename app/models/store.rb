class Store

  def initialize(store_data)
    @name = store_data[:name]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @store_type = store_data[:storeType]
  end

  def self.create(zip)
    serv = BestBuyService.new
    serv.find_stores(zip).map do |store_data|
      Store.new(store_data)
    end
  end
end
