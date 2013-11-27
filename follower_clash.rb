require 'rubygems'
require 'bundler/setup'
require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('ornellasmike')
user2 = UserComparer::User.new('techpeace')
puts "#{user1.username}'s follower count: #{user1.followers}"
puts "#{user2.username}'s follower count: #{user2.followers}"
comparer = UserComparer::Comparer.new(user1, user2)
puts "#{user1.username}'s friend count: #{user1.friends}"
puts "#{user2.username}'s friend count: #{user2.friends}"
puts "#{user1.username}'s tweet count: #{user1.tweets}"
puts "#{user2.username}'s tweet count: #{user2.tweets}"
puts "The user with the most followers is: #{comparer.compare}"
puts "The user with the most friends is: #{comparer.comp_friends}"
puts "The user with the most tweets is: #{comparer.comp_tweets}"
puts "#{user1.username}'s most recent tweet said: #{user1.last_status}."
puts "#{user2.username}'s most recent tweet said: #{user2.last_status}."
puts "#{user1.username}'s name in real life is: #{user1.name}"
puts "#{user2.username}'s name in real life is: #{user2.name}"