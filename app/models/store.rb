class Store

  attr_reader :name,
              :city,
              :distance,
              :phone,
              :store_type,
              :total

  def initialize(store_data)
    @name = store_data[:name]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @store_type = store_data[:storeType]
  end

  def self.create(zip)
    serv = BestBuyService.new
    return_data = serv.find_stores(zip)
    @total = return_data[:total]
    return_data[:stores].map do |store_data|
      Store.new(store_data)
    end
  end
end
