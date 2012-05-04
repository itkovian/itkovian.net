-----
title:  AFS does not like screen
author: Andy Georges
date: December 13, 2007
tags: 
-----







People at our department are often running jobs that take multiple days
to complete. A good way to keep a job going is to use the
[screen](http://www.gnu.org/software/screen/) tool. This allows one to
keep running a shell even when not connected to the machine for a while,
and to reconnect to that session when you login on the machine once
more. Simple, lean and mean.


Suppose you wish to run a job, and save its output to a file that
resides on your home directory, which is, incidentally, and AFS mount.
You log in, get a token (as per the manual method described
[here](http://www.itkovian.net/base/afs-elis), fire up screen, start
your job, leave screen (using the nice ctrl-a-d keystroke), and log out
because you like to take your laptop home (which sounds almost like the
purpose of having a laptop in the first place). The next day you arrive
at the office, turn on the laptop, connect it to the omnipresent
ethernet, and log into the machine (yes, you request a token again) and
you check the output of you job ... Not a good idea if you have a faint
heart, or that data was really, really due, like yesterday.


Why, the innocent reader now asks? Well, clearly, because the output has
not made its way to the file as you would have liked it to do. To cut
short the story: the moment you logged out, your AFS token was revokes,
or became invalid, or whatever, and the file that was greedily accepting
your bits suddenly was inaccessible to your process. For example,





i=0;


while(true); do


echo "hup $i"


sleep 1;


echo "pup $i";


i=


done;


woud yield this:


hup 0


pup 0


hup 1


pup 1


hup 2


pup 2


hup 3


pup 3


hup 4


hup 17


pup 17


hup 18


pup 18


hup 19


pup 19


hup 20


pup 20


hup 21


pup 21


hup 22


if you had logged out after 4 seconds and logged back in (and acquired a
token) about 13 seconds later.


Boooooo! Eat that.


Of course, a simple workaround exists: save the data temporarily to a
local file on the machine, e.g., in /tmp (and pray that the tmp dir is
not wiped nightly). But that does kind of defeat the purpose of having a
secure filesystem on which to store your data, does it not?




