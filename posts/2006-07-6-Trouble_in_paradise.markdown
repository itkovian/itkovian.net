-----
Title:  Trouble in paradise
Author: Andy Georges
Date: July 6, 2006
-----







We've been playing with the new MacBook for a few days now, and thus far
everything seemed very cool. After
[reinstalling](http://www.flickr.com/photos/itkovian/180473242/in/photostream/)
MacOSX, we gained a lot of disk space because we ditched most of the
printer drivers, garageband and a few other space hogs. We installed
Adium, MplayerOSX, configured Mail.app, set up the home-banking stuff,
etc. So, all was well. Or so we thought.


Forward four days. My girl would like to fiddle around with MySQL and
PHP, so I decided to get Fink off teh internets. That way, we could get
all the goodies we wanted. It was the picking of the fruit in the
Garden, it seemed. The installer refused to finish, although when I
checked the /sw directory tree, it looked pretty much ok. Thus. Kill the
installer, check the logs. Nothing strange. Ah well, perhaps we can now
install XCode, and I'll check what went wrong later, I thought. No can
do, the XCode installer told me. I tailed the logs, I retried, and I
only got the same message indicating that somewhere, something was not
ok. Permission denied. Being a relative newbie myself, I ls'd through
the directory tree, but it seemed all right. Not true, I later found
out. After a reboot (yeah, yeah) and a few failed attempts, I tried to
start the Activity Monitor application. Nope. Nothing. Nil. Nada. Didn't
start, though it was running fine before the reboot.


In the end googling around, chatting on 
problem was. It turned out that the permissions of several files can be
fubar'd when an installer runs, or, as teh internets put it: 'run Disk
utility to fix permissions after installing'. Fired it up. Checked
permissions. They were fubar, that was certain. Fixing them involved
running the Disk Utility by sudo. In the end it all worked out. After
the permissions were fixed, the XCode installer did what it was supposed
to do, and I ran the pathsetup goodie from Fink.


But the question remains this: what can possibly require an installation
script to change file permissions on files it need not touch? I was in
love with Mac OSX before. After this event, I've cooled down a bit.




