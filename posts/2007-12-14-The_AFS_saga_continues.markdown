-----
title:  The AFS saga continues
author: Andy Georges
date: December 14, 2007
description: 
tags: 
-----







In the [previous](http://www.itkovian.net/base/afs-does-not-screen)
post, I mentioned that AFS denies access to your files when you do not
have a token. This is still true, but apparently, you are able to launch
both [at](http://unixhelp.ed.ac.uk/CGI/man-cgi?at) and
[cron](http://unixhelp.ed.ac.uk/CGI/man-cgi?cron+8) jobs using keytabs.
This is a file, residing outside of the AFS realm, containing the
password in some processed form (so the password is not available in
clear text). Keytabs are created by the system administrator. More
information is available [here](https://www.elis.ugent.be/en/node/1467)
(ELIS internal use only). This seems like the best way forward, and also
the most secure approach.


There is, hoewever, a far less secure alternative. You can provide your
password in a file, or interactively, to the kinit process which will
then obtain a token on behalf of the application you wish to execute, by
doing


kinit --password-file=filename application


Saving the password in a file (especially outside of AFS) seems like a
major security issue, but that's probably me.




