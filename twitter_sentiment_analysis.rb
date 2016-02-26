require "rubygems"
require "oauth"
require "json"
require "colorize"


puts "AN ANDELA BOOTCAMP XV PROJECT".green 
puts "               ON        ".green
puts "TWITTER SENTIMENT ANALYSIS CONSOLE APPLICATION".green
puts "               BY        ".green
puts "       EHIEMERE OGENNA FAITH       ".green
					

puts "Please Input Username".green
while user_name == gets.chomp 
  if user_name == "2rufaith"
    class Twit
    # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
      def self.prepare_access_token(oauth_token, oauth_token_secret)
  			consumer = OAuth::Consumer.new("LO7HU55NMAbaP2TOqD5uB10hO", "OyptrpneOUp9J2UlIVLjlh94yaXGLN7jlLZi0ap6KdxJMlEmsC", { :site => "https://api.twitter.com", :scheme => :header })
     
 				 # now create the access token object from passed values
  			token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
  			access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
 
   			return access_token
 			end
 
 			def self.process_tweets(msg)
  	# # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
  		data_hash = msg.map {|x,y| y }
 			puts msg

 				File.open("twitsentiment.json", "a") do |f|
  			f.puts(msg.to_json)
  			end

 			  frequencies = Hash.new(0)
 			  array = msg.join(',').split(/[^a-zA-Z]/)
 			  array = array.flatten
 
 			  array.each {|x| frequencies[x] += 1}
 			  frequencies = frequencies.sort_by {|a, b| b }
 			  frequencies.reverse!
 				File.open("word_sort.json", "a") do |f|
  			f.puts(frequencies.to_json)
  			end


 			end
 
 # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
 			access_token = prepare_access_token("2244345532-HyFTUDXI1xqsshU6hUgbOqCDvTqz7VSUxGji7dx", "9EawDbEolBBLIkh8E6jgdbJxBpLTGnr7QY4fRVTMo4ZSJ")
 
      # use the access token as an agent to get the home timeline
      puts "Please Input screen name".green
      user_id = gets.chomp
      puts "Please Input tweet counts"
  	  tweet_count = gets.chomp.to_i

 			response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{user_id}&count=#{tweet_count}")
 			result = []
				if response.code == '200' then
  				tweets = JSON.parse(response.body)
  				# print tweets
  				 # result = {}
  			  tweets.map do |x|
  				result<<"#{x['user']['screen_name']}:#{x['text']}".yellow

 				  end
				process_tweets(result)
 		    end
			break
	
		end
	else
 		puts "Invalid Username, Please input correct username".red
 	end

end
