-----
Title:  AFS in ELIS
Author: Andy Georges
Date: December 12, 2007
----







Rejoice! I received a mail announcing my home directory and the files on
it from the ELIS department would be moved to and AFS share.


I would need to change my password, and a new one was kindly sent to me
in clear text. Nevermind the fact that accounts had been compromised
easily in the past by sniffers installed on the local network, clear
text clearly is the chosen way to distribute passwords, especially if
users need to be moved to a more secure environment.


What I had heard in the previous months, or more accurately, year, did
not give me much confidence this transition would go smooth. On the
other hand, why would joe average (i.e., me) be transferred if the
system still had some bugs? So, bold as I sometimes am (from a
distance), I agreed to the immediate move. Most of my important data is
residing on other machines anyway, so I figured, why not? Ah well. Let's
change the password, using the designated kerberos passwd utility. Cool.
Except it was not. The next login using the new password did not work. I
was happy to have kept the email with the clear-text password, as it
turned out I needed it *again*. Changed my password again. This time it
seemed to hold. My account had already been moved, but somehow the NFS
server or client (I've no idea (yet) how those things really work) did
not release the mount, causing the system to refuse mounting the AFS
share for my home directory. A few emails sorted that out, after the
sysadmin reset the NFS mount manually. So far, so good.


The next issue came up when I opened an SSH session to the ssh server at
the ELIS department. Clearly, something was wrong. Even though I wound
up in my home directory, and the SSH DSA key was used to get me logged
into the system, I could not access any of my data. I checked using the
*fs* command, which showed me I had all the rights in my home directory
(rlidwka). But no way AFS was going to allow me to access my data, or
even let me create a new file. It turns out that logging in with the SSH
key is not a good idea, as the system then does not get you an AFS
token. To get that, you need to manually request a token. This of course
fubars the entire idea behind passwordless SSH usage (e.g., scp'ing
files) because you need to execute an additional command such that you
actually are allowed access to your files. Strangely, scp'ing a file
actually works, if you are logged into your account. The leads me to
believe a token is valid for a ll communications from a user. Weird.
Basically, to scp data you need to execute two commands: one to get you
logged in and acquire a token, and one to copy data.


I remain unconvinced. Normally, I am all in favour of using cool
technology, but now, I am unsure.




