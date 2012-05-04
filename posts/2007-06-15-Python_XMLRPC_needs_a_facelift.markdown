-----
title:  Python XML-RPC needs a facelift.
author: Andy Georges
date: June 15, 2007
tags: 
-----







I have been experimenting with the Python XML-RPC implementation for a
while now, and yesterday, I came across what is most accurately
described as a bug. Let's consider a nice figure to illustrate how the
XML-RPC implementation handles things in the Python 2.5 release.


[![image](5F677A6E-1F5E-45A3-BBFF-1F972E5BF21F-1.png)](http://www.flickr.com/photos/itkovian/552174803/)


So, basically the XML-RPC ServerProxy files a request with the Transport
class to deliver the XML goodies to the remote server. However, in the
current implementation, Transport uses httplib.HTTP. This is a wrapper
class that uses HTTPConnection for most things, but not for receiving
responses from the server. And that is exactly where the problem lies.
The HTTP.getreply function fetches the HTTP status, reason and headers.
But the XML-RPC Transport class does not check the headers for any
indication of a content length. When they get the response, things
really turn haywire. No matter what, they ask a socket (or a file
imposing as a socket) to read 1024 bytes. The socket library tries to
comply, but obviously when either the content is shorter, or the
connection is closed after the content has been read, an error is
raised.


So what are the options to correct this behaviour. I think one can do
two things. First of all, fix the Transport function that asks the
socket for data to use an extra argument indicating the expected payload
size. Obviously, once the headers are received they should be chacked
for the presence of a Content-Length field and the requested size should
correspond to the value in this length field. I've implemented that and
it works.


However, I think a second option is perhaps better. Why remain with the
HTTP class when a nice and shiny HTTPConnection class is available that
does all we need and more? Let's move the XML-RPC HTTP connection object
to that class, and voila! Fixed.


In unified diff format, it boils down to this:


--- /sw/lib/python2.5/xmlrpclib.py 2006-11-29 02:46:38.000000000 +0100


+++ xmlrpclib.py 2007-06-15 15:59:02.000000000 +0200


@@ -1182,23 +1182,13 @@


self.send


self.send


- errcode, errmsg, headers = h.getreply()


+ response = h.getresponse()


+


+ if response.status != 200:


+ raise ProtocolError(host + handler, response.status, response.reason,
response.msg.headers)


- if errcode != 200:


- raise ProtocolError(


- host + handler,


- errcode, errmsg,


- headers


- )


-


- self.verbose = verbose


-


- try:


- sock = h.


- except AttributeError:


- sock = None


-


- return self.


+ payload = response.read()


+ return payload








@@ -1250,7 +1240,7 @@





import httplib


host, extra


- return httplib.HTTP(host)


+ return httplib.HTTPConnection(host)




