require 'rubygems'
require 'oauth'
require 'json'

# Now you will fetch /1.1/statuses/user_timeline.json,
# returns a list of public Tweets from the specified
# account.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json"
query   = URI.encode_www_form(
    "screen_name" => "2rufaith",
    "count" => 10,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

# Print data about a list of Tweets
def print_timeline(tweets)
  # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
  tweets.each{|tweet|
    puts "#{tweet['user']['name']}(#{tweet['user']['screen_name']}) - #{tweet['text']}"

  }
end

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# If you entered your credentials in the first
# exercise, no need to enter them again here. The
# ||= operator will only assign these values if
# they are not already set.
consumer_key ||= OAuth::Consumer.new "LO7HU55NMAbaP2TOqD5uB10hO","OyptrpneOUp9J2UlIVLjlh94yaXGLN7jlLZi0ap6KdxJMlEmsC"
access_token ||= OAuth::Token.new "2244345532-HyFTUDXI1xqsshU6hUgbOqCDvTqz7VSUxGji7dx","9EawDbEolBBLIkh8E6jgdbJxBpLTGnr7QY4fRVTMo4ZSJ"

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
end
nil

response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=JstLeslie&count=30"
