require 'nokogiri'
require 'open-uri'

url = 'http://qpod.jp'
n = Nokogiri::HTML(open url)
x = '//div[@class="coupon_detail"]'
p n.xpath(x)[1]



#x2 = '//span[@class="coupon_name"]'
#p n.xpath(x2)
