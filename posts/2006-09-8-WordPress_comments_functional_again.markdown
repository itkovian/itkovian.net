-----
title:  WordPress comments functional again
author: Andy Georges
date: September 8, 2006
tags: 
-----







I fixed the bug that disallowed people to post comments. It turned out
that two things were causing this. First of all, the machine purportedly
running the web server for our department seemingly forwards request to
another machine, causing the WordPress stored root to differ from the
actual root. In some way, this ensures that the $
empty. Second, in the php file processing the comments, somebody seems
to have thought that the $
Which should never be the case.


So feel free to fill my hard drive space up with your witty, hilarious,
or outright hostile comments.




