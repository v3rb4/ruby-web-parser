require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'

# Function for parsing a web page
def parse_website(url)
  begin
    puts "Starting to parse website: #{url}"
    
    # Open URL and get headers
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    puts "\nSecurity Headers:"
    security_headers = ["Content-Security-Policy", "Strict-Transport-Security", "X-Frame-Options", "X-Content-Type-Options"]
    security_headers.each do |header|
      puts " - #{header}: #{response[header]}" if response[header]
    end

    # Download HTML
    html = URI.open(url, "User-Agent" => "Mozilla/5.0").read
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

    # Look for potential admin or sensitive pages
    puts "\nPotential Sensitive Links:"
    sensitive_keywords = ["admin", "login", "dashboard", "config", "backup"]
    doc.css('a').each do |link|
      href = link['href']
      puts " - Suspicious link found: #{href}" if href && sensitive_keywords.any? { |keyword| href.include?(keyword) }
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