require('yaml')
require('twitter')
$configs = YAML::load_file '../config.yml'


module Manohar
	class Twit

		attr_reader :user_name, :handle

		@@twitterConf =  OpenStruct.new $configs['twitter']

		def initialize user_name
			p "Please provide user name" and return  unless user_name
			@user_name = user_name
			prepare_twitter_handle
		end

		def getTweets
			@handle.user_timeline @user_name, count: 200

		end


		private
		def prepare_twitter_handle
			@handle = Twitter::REST::Client.new do |config|
			  config.consumer_key        = @@twitterConf.consumer_key
			  config.consumer_secret     = @@twitterConf.consumer_secret
			  config.access_token        = @@twitterConf.access_token
			  config.access_token_secret = @@twitterConf.access_token_secret
			end
		end




	end



end
