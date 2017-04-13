class Store

  attr_reader :service,
              :name,
              :city,
              :distance,
              :phone,
              :store_type,
              :total

  def initialize(store_data)
    @name = store_data[:longName]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @store_type = store_data[:storeType]
  end

  def self.serv
    @service ||= BestBuyService.new
  end

  def self.create(zip)
    serv.find_stores(zip)[:stores].map do |store_data|
      Store.new(store_data)
    end
  end

  def self.total(zip)
    serv.find_stores(zip)[:total]
  end
end
