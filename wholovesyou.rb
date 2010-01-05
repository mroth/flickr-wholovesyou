#!/usr/bin/env ruby
require 'rubygems'
require 'flickraw'
require 'choice'

#command line option parsing fun
Choice.options do
  option :user, :required => true do
    short '-u'
    long '--user'
    desc 'Username to search for. (required)'
  end
  option :quiet do
    short '-q'
    long '--quiet'
    desc 'Quiet mode -- results only.'
    default false
  end
  option :num_results do
    short '-n'
    long '--results'
    desc 'Output top N results. (default: 10)'
    cast Integer
    validate /^\d+$/
    default 10
  end
end

#method to log program status to screen (so it can be suppressed)
def status(str)
  if !Choice.choices[:quiet]
    print str
    STDOUT.flush
  end
end

#the actual code begins here!
#...lookup user
username = Choice.choices[:user]
begin
  uid = flickr.people.findByUsername(:username => username).nsid
rescue FlickRaw::FailedResponse
  puts "ERROR: These aren't the droids you are looking for.\
  (No Flickr member found by that name, or they are hiding themselves from profile search.)"
  exit 1
end

#...get matches
list = flickr.photos.search(:tags =>username, :per_page => '10')
#TODO: update this to use hyphy search

#...iterate over photos and hashcount the favers
status("Analyzing #{list.size} public photos of #{username} (#{uid})\n")
freqs = Hash.new(0)
list.each do |photo|
  status('.')
  faves = flickr.photos.getFavorites(:photo_id => photo.id)
  faves.person.each do |person|
    freqs[person.username] += 1
  end
end
freqs = freqs.sort_by {|x,y| y }
freqs.reverse!

#...output results
status("\nTOP #{Choice.choices[:num_results]} RESULTS:\n")
freqs[0,Choice.choices[:num_results]].each {|word, freq| puts word+' '+freq.to_s}

