require 'nokogiri'
require 'open-uri'

# Function for parsing a web page
def parse_website(url)
  begin
    puts "Starting to parse website: #{url}"
    # Download HTML from the specified URL
    html = URI.open(url).read
    # Parse HTML using Nokogiri
    doc = Nokogiri::HTML(html)

    # Find all headers (h1, h2)
    puts "\nHeaders on the page:"
    doc.css('h1, h2').each do |header|
      puts " - #{header.text.strip}"
    end

    # Find all links (<a>)
    puts "\nLinks on the page:"
    doc.css('a').each do |link|
      href = link['href']
      text = link.text.strip
      puts " - Text: #{text}, URL: #{href}" unless href.nil?
    end

    puts "\nParsing completed!"
  rescue OpenURI::HTTPError => e
    puts "Error: failed to access #{url} — #{e.message}"
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
end

if ARGV.empty?
  puts "Specify a URL for parsing, for example: ruby web_parser.rb https://example.com"
else
  parse_website(ARGV[0])
end
