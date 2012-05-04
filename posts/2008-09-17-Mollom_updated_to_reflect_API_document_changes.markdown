-----
title:  Mollom updated to reflect API document changes
author: Andy Georges
date: September 17, 2008
tags: 
-----







As you may be aware of, the Mollom API has undergone some small changes
in order to better deal with load balancing. A side effect of this is
that the Python module I wrote and maintain had to be updated as well.
Meanwhile, I uncovered a few bugs, the most important of which resulted
in the inability to handle empty server lists provided by the Mollom
service. As far as use of the module is concerned, there are not really
any changes, except one. The MollomBase class now provides a non-empty
method that implements a basic callback cache strategy for the server
list.


You can find the tarball containing the modules and the darcs repository
[here](http://itkovian.net/packages/python_mollom_0.2.tgz). To pull from
the darcs repository, use darcs get
http://itkovian.net/darcs/python




