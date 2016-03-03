

class Recipe
  include HTTParty
  default_options.update(verify: false)

  ENV['FOOD2FORK_KEY'] = "f852fcad0e363c813baaaadd3f01c814"
  #ENV['FOOD2FORK_SERVER_AND_PORT'] = ":80"
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
 # hostport = 'www.food2fork.com'
 
  base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY'], q: "chocolate"
  format :json

  def self.for keyword
    get("/search", query: { q: keyword})["recipes"]
  end
end