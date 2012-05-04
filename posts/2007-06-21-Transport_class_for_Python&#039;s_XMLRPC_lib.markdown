-----
title:  Transport class for Python&
author: Andy Georges
date: June 21, 2007
tags: 
-----







Given that the xmlrpclib.Transport class can be derived, it is perhaps
easier to define a new transport class that implements the patch shown
in the
[facelift](http://www.itkovian.net/base/python-xml-rpc-needs-facelift)
post, though I still believe Python's XML-RPC library is due a much
needed update.


Thus, I present the [HTTPTransport
class](http://itkovian.net/base/files/HTTPTransport.py):


*Update*: It seems I forgot to parse the resulting payload. this is now
fixed in the updated code below.


from xmlrpclib import Transport


from xmlrpclib import ProtocolError


class HTTPTransport(Transport):

















def make





import httplib


host, extra


return httplib.HTTPConnection(host)


























def request(self, host, handler, request





h = self.make


if verbose:


h.set


self.send


self.send


self.send


self.send


response = h.getresponse()


if response.status != 200:


raise ProtocolError(host + handler, response.status, response.reason,
response.msg.headers)


payload = response.read()


parser, unmarshaller = self.getparser()


parser.feed(payload)


parser.close()


return unmarshaller.close()




