# flickr-wholovesyou

_OoOoOoOOOhhh somebody liiiiiiiiiiiikes yoooooou!!_

A quick and dirty command line tool to see what Flickr members most frequently favorite photos of you (or someone else you know!).  This uses the People in Photos feature (API documentation coming soon to Flickr!)

## Usage

	Usage: wholovesyou.rb [-uqn]
	    -u, --user                       Username to search for. (required)
	    -q, --quiet                      Quiet mode -- results only.
	    -n, --results                    Output this many of top results.

## Examples

	$ ./wholovesyou.rb -u mroth -n 10
	Analyzing 222 public photos of mroth (91842418@N00)
	....................................................
	TOP 10 RESULTS:
	flickrjo 19
	Avatara 10
	jakerome 10
	mroth 9
	.schill 9
	j.fisher 8
	lhl 7
	jeanniey 6
	Kevin 6
	waferbaby 5


## License
Share and enjoy!

## Author
Matthew Rothenberg
http://mroth.info
