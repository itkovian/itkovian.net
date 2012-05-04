-----
Title:  Haskell wraper for Mollom
Author: Andy Georges
Date: October 6, 2008
----







I have been a Haskell fan since I first get introduced to the language,
in the now deprecated course taught by [Koen De
Bosschere](http://www.elis.ugent.be/~kdb) when I took my final year
before graduating as a licentiate in computer science (which would now
be a MsC. in CS). Due to a lack of time, mostly, I never proceeded very
far beyond the basics, not even when I was a teaching assistant for this
course. Still, with [Mollom](http://mollom.com/) having been released,
the Haskell application database
[Hackage](http://hackagedb.haskell.org/) finally coming into adulthood,
or some form of it, I deemed the time ripe to attempt writing a wrapper
for Mollom.


That said, first thing to do is check Hackage and find stuff we can
reuse.
[haxr](http://hackage.haskell.org/cgi-bin/hackage-scripts/package/haxr)
immediately comes to mind for the XMLRPC stuff. Other packages I am
using are
[base64-string](http://hackage.haskell.org/cgi-bin/hackage-scripts/package/base64-string),
[crypto](http://hackage.haskell.org/packages/archive/Crypto/4.1.0/doc/html/Data-Digest-SHA1.html),
[configfile](http://hackage.haskell.org/cgi-bin/hackage-scripts/package/ConfigFile),


Installing the above will download and install a number of other
libraries on which these depend. Still, Hackage seems to do the trick
just fine, installing everything I needed.




