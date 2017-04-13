class BestBuyService

  def find_stores(zip)
    parse(HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=name,storeType,distance,city,phone&apiKey=#{ENV['API_KEY']}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
