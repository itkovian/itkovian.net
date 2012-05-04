-----
title:  On the joys of C
author: Andy Georges
date: December 2, 2006
tags: 
-----







Half a year ago, I
[posted](http://trappist.elis.ugent.be/~ageorges/blog/2006/03/09/programming-languages-or-lack-thereof/)
about the lack of programming language knowledge the CS students have,
and which they require for courses besides the actual programming
courses. Yesterday I was assisting at a practicum on operating systems.
The assignment was quite easy: add some code to get a working linux
module that allows mounting and reading a tarball. To my horror, the
following snippets were jotted down in the students favourite editor
(pico). FYI, bd is a char
Find the errors. Pick your favourite one.


String name;


char 


strncpy(tmp, bd[124], 12);


bd.substring(124,136);


printk("size = " + this


And, oh joy! Who needs compiler warnings or errors anyway? Crap spouted
to the screen can be safely ignored until we get a kernel oops, or
better, a automatic reboot.


We really, really need to teach these kids something besides Java. There
is supposedly a [C course](http://zeus.ugent.be:2080/oldpubs/c/c.pdf)
compiled by students that they very urgently need to read!




