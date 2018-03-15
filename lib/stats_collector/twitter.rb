class StatsCollector
  class TwitterAccount
    require 'twitter'

    MYSQL_TABLE = 'twitter_account'.freeze

    def stats
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end

      followers_count = client.user(ENV['TWITTER_SCREEN_NAME']).followers_count
      tweets_count = client.user(ENV['TWITTER_SCREEN_NAME']).tweets_count
      { followers_count: followers_count, tweets_count: tweets_count }
    end
  end
end
