

require "rubygems"

require "oauth"

require "json"

Exchange your oauth_token and oauth_token_secret for an AccessToken instance.

puts "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
puts "  '                   AN ANDELA BOOTCAMP XV PROJECT                                 '  " 
puts "  '                               ON                                                '  "
puts "'''''''''  Twitter Sentiment Analysis Console App by Ehiemere Ogenna Faith ''''''''''''"
          

puts "Please Input Username"
while user_name = gets.chomp 
  if user_name == "2rufaith"
def prepare_access_token(oauth_token, oauth_token_secret)

    consumer = OAuth::Consumer.new("LO7HU55NMAbaP2TOqD5uB10hO", "OyptrpneOUp9J2UlIVLjlh94yaXGLN7jlLZi0ap6KdxJMlEmsC", { :site => "https://api.twitter.com", :scheme => :header })

     

    # now create the access token object from passed values

    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }

    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

 

    return access_token

end

 

# Exchange our oauth_token and oauth_token secret for the AccessToken instance.

access_token = prepare_access_token("2244345532-HyFTUDXI1xqsshU6hUgbOqCDvTqz7VSUxGji7dx", "9EawDbEolBBLIkh8E6jgdbJxBpLTGnr7QY4fRVTMo4ZSJ")

 

# use the access token as an agent to get the home timeline
puts "Please Input screen name"
 screen_name = gets.chomp
puts "Please Input tweet counts"
  tweet_count = gets.chomp


response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=JstLeslie&count=10")

result = JSON.parse(response.body)

 result.each do |x|

 sorted_values = "#{x['user']['screen_name']} :#{x['text']}"

    puts sorted_values

File.open("twitsentiment.json", "a") do |f|

 f.puts(result.to_json)

 f.close

end
break
end
  
else
    puts "Invalid Username, Please input correct username"
  end
end


