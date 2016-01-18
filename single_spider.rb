require 'open-uri'
require 'nokogiri'

class SingleSpider
  def initialize url, path
    @url = url
    @path = path
    @doc = Nokogiri::HTML(open(@url))
    @img_urls = []
  end

  def get_imgs
    folder = "#{@path}/#{title}".gsub('//', '/')
    `mkdir -p '#{folder}'`
    img_urls.each do |url|
      `wget -P '#{folder}' #{url}`
    end
  end

  def img_urls
    @doc.xpath("//img[@class='origin_image zh-lightbox-thumb lazy']").each do |node|
      @img_urls << node.attributes['data-original']
    end
    @img_urls
  end

  def title
    @doc.xpath("//h2[@class='zm-item-title zm-editable-content']").text.to_s
  end
end

class CollectionSpider
  def initialize url, path
    @path = path
    @urls = []
    @doc = Nokogiri::HTML(open(url))
  end

  def get_imgs
    urls.each do |url|
      SingleSpider.new("http://www.zhihu.com#{url}", @path).get_imgs
    end
  end

  def urls
    @doc.xpath("//h2[@class='zm-item-title']/a").each do |node|
      @urls << node.attributes['href'].value
    end
    @urls
  end
end
