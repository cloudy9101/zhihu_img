require './single_spider.rb'

url = ARGV[0]
path = ARGV[1]


if url =~ /.*collection*./
  CollectionSpider.new(url, path).get_imgs
else
  SingleSpider.new(url, path).get_imgs
end
