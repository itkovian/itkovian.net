-----
Title:  Flickr favourites
Author: Andy Georges
Date: July 13, 2007
----







As with any social networking site, people can walk out, drop content,
or get banned. So if you have faved a nice selection of flickr pictures
you might wish to be able to look at them, even if the owner takes them
offline. A tool to check the list of your favourites, and download them
if possible, in the size you prefer (e.g., medium) may come in handy.
Thus I present a simple python
[script](http://itkovian.net/base/files/favourites.py) I wrote to do
just that. You also need Brian Hall's
[flickrapi.py](http://beej.us/flickr/flickrapi/), of which you can also
get a [snapshot](http://itkovian.net/base/files/flickrapi.py) with which
the favourites script works.


You need a configuration file as explained in the favourites script
file, with two sections: general and flickrapi. The former contains the
name of the browser that will be used to setup your flickr account to
allow access to it using the API key you want to use with this
application. The latter contains the API key and the API secret, both of
which you can obtain from flickr.




