-----
title:  Python wrapper for Mollom
author: Andy Georges
date: May 8, 2008
tags: 
-----







With the release of the [Mollom](http://mollom.com/)
[API](http://mollom.com/api), I have cleaned up and documented my Python
wrapper for the API.


You can get the code from the [darcs](http://darcs.net/) repository at
http://itkovian.net/darcs/python
[tarball](http://itkovian.net/packages/python_mollom_0.2.tgz) is also
available.


For the moment, the repository contains two files Mollom.py and
HTTPTransport.py. The former contains the MollomAPI and MollomFault
classes. The latter contains a derived class to deal with HTTP transport
in the XML PRC library, as the default Python code does not seem to do
things correctly. To get the response from the Mollom service as a
Python dictionary, you need to either use the provided HTTPTransport
class or provide your own implementation


To deal with caching and using session IDs a MollomBase class is
present, which can be overridden to allow a user defined caching
mechanism for the server list to be used. This class is still under
heavy development, so it is prone to (frequent) changes.


MollomAPI offers the following methods:


-   -   getServerList
-   checkContent
-   sendFeedback
-   getImageCaptcha
-   getAudioCaptcha
-   checkCaptcha
-   getStatistics
-   verifyKey


I plan to see if I can get this into
[Django](http://www.djangoproject.com/) as well as a contributed app
that can be included in a Django project.


**Update (2008/09/18)** I have incorporated the changes made to the API
document on 2008/09/10. The version of the tarball has been bumped to
0.2. Additionally some bugs were fixed, so you might want to update to
this version rather than sticking with the old one.


**Update (2010/02/08)** I have moved the code to a new repository at
[GitHub](http://github.com/itkovian/PyMollom). Get the library using git
clone git://github.com/itkovian/PyMollom.git. For now, I do plan on
keeping the darcs repo hosted at my website and the github repo in sync,
so you can pull from either.




