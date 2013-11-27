require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'foreman'

module UserComparer
  class User
  	attr_reader :username
  	def initialize(username)
  		@username = username
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['OAUTH_TOKEN']
        config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
      end
  	end

  	def followers
  	  @client.user(@username).followers_count
  	end

    def friends
      @client.user(@username).friends_count
    end

    def tweets
      @client.user(@username).statuses_count
    end

    def last_status
      @client.user(@username).status.text
    end

    def name
      @client.user(@username).name
    end

  end

  class Comparer
  	def initialize(user1, user2)
  		@user1 = user1
  		@user2 = user2
  	end

  	def compare
  		# returns user with more followers, or both if even
  		if @user1.followers > @user2.followers 
  			return "#{@user1.username} has more followers!"
  		elsif @user1.followers < @user2.followers
  			return "#{@user2.username} has more followers!"
  		else
  			return "#{@user1.username} and #{@user2.username} have the same number of followers!  Who knew!?"
  		end
  	end

    def comp_friends
      # returns user with more friends, or both if even
      if @user1.friends > @user2.friends
        return @user1.username
      elsif @user1.friends < @user2.friends
        return @user2.username
      else
        return "#{@user1.username} and #{@user2.username} have the same number of friends!  Who knew!?"
      end
    end

    def comp_tweets
      # returns user with more tweeta, or both if even
      if @user1.tweets > @user2.tweets
        return @user1.username
      elsif @user1.tweets < @user2.tweets
        return @user2.username
      else
        return "#{@user1.username} and #{@user2.username} have the same number of tweets!  Who knew!?"
      end
    end

  end
end


