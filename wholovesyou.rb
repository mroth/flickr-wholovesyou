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

#the actual code!
username = Choice.choices[:user]
list = flickr.photos.search(:tags =>username, :per_page => '20')
status("Analyzing #{list.size} photos of #{username}\n")
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

#output results
status("\nTOP #{Choice.choices[:num_results]} RESULTS:\n")
freqs[0,Choice.choices[:num_results]].each {|word, freq| puts word+' '+freq.to_s}

