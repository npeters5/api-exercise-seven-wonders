require 'httparty'
require "awesome_print"

#Starter Code:
seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]


class Seven
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def location_information
    encoded_uri = URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{name}&key=AIzaSyAHU61kyNhjp7dna0lhH_0tB352tQwaq5A")

    response = HTTParty.get(encoded_uri)

    return response.parsed_response["results"][0]["geometry"]["location"]
  end

end

output = {}

seven_wonders.each do |wonder|
  a = Seven.new(wonder)
  output[a.name] = a.location_information
end

ap output







#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
