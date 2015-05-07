require 'barge'
require 'awesome_print'

token = ENV['DIGITALOCEAN_API_TOKEN']
client = Barge::Client.new(access_token: token)
# p client.image.all
# p client.region.all

region_images = []

imgs = client.image.all
imgs.images.each do |x|
  if x.regions.include? 'sgp1' and x.distribution == 'CentOS'
    region_images << x 
  end
end

ap region_images