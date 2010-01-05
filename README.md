# flickr-wholovesyou

_OoOoOoOOOhhh somebody liiiiiiiiiiiikes yoooooou!!_

A quick and dirty command line tool to see what Flickr members most frequently favorite photos of you (or someone else you know!).

*This is using a placeholder API method until the People in Photos API is made public.*

## Usage

	Usage: wholovesyou.rb [-uqn]
	    -u, --user                       Username to search for. (required)
	    -q, --quiet                      Quiet mode -- results only.
	    -n, --results                    Output this many of top results.

## Examples

	$ ./wholovesyou.rb -u mroth -n 5
	Analyzing 297 public photos of mroth (91842418@N00)
	....................................................
	TOP 5 RESULTS:
	flickrjo 22
	mroth 14
	.schill 11
	lhl 10
	Fenchurch! 8
	

## License
Share and enjoy!

## Author
Matthew Rothenberg
http://mroth.info
