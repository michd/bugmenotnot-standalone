require 'nokogiri'
require 'open-uri'
require 'json'

ITEM_SELECTOR = 'article.account'
USERNAME_SELECTOR = 'dl dd:nth-of-type(1)'
PASSWORD_SELECTOR = 'dl dd:nth-of-type(2)'
OTHER_SELECTOR = 'dl dd:nth-of-type(3):not(.stats)'

site = ARGV[0]
filename = ARGV[1] || "#{site}-bugmenotnot.json"

unless site
  abort "\nUsage: ruby bugmenotnot.rb <site domain>\n\n\tExample:\n\truby bugmmenotnot.rb example.org\n "
end

doc = Nokogiri::HTML(open("http://bugmenot.com/view/#{site}"))

output = []
doc.css(ITEM_SELECTOR).each do |item|
  login_details = {
    :username => item.css('dl dd:nth-of-type(1)').text,
    :password => item.css('dl dd:nth-of-type(2)').text
  }

  other = item.css('dl dd:nth-of-type(3):not(.stats)').text

  login_details[:other] = other if other.strip != ''
  output << login_details

end

outfile = File.open(filename, "w")
outfile << JSON.generate(output)

puts "Found #{output.length} entries, Exported to #{filename} as JSON."

