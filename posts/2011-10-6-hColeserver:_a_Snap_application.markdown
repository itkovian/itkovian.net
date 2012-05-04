-----
title:  hCole-server: a Snap application
author: Andy Georges
date: October 6, 2011
tags: 
-----







During the 9th GhentFPG meeting, I gave a lightning talk about the
hCole-server [Snap](http://snapframework.com) application I had hacked
together during the [Haskell](http://haskell.org) hackathon last summer
in Cambridge. hCole-server acts as a front-end to a bunch of scripts
that fire off a computation on the Ghent University supercomputer
backend for determining the effect of a sequence of optimisation passes
in the LLVM compiler when applied to the SPEC CPU 200[06] benchmarks.


Basically, I used Snap to deal with requests, routing them to a handler
that uses two Snap extensions: the HDBC extension and a filesystem cache
extension I wrote. When a sequence is submitted to hCole-server in the
form of a string consisting of ints separated by dashes, there are four
possible outcomes:


1.  This a new sequence that has never been requested before.
2.  The sequence has been requested in the past, but the experiment is
still running.
3.  The results for the sequence are available in the filesystem cache.
4.  Some error occurred.


In the first case, a new job is prepared and started, the database is
updated to reflect this (inserting a busy entry for this sequence) and
the server waits for the next request. In the second case, we return a
JSON string indicating we’re still waiting for results to roll in. In
the third case, we extract the measurements from the tarball and wrap it
in a JSON data structure and return it as the server response. In the
last case, we oops. This is also illustrated in the following figure.


Because the experiment scripts automagically fetch completed jobs from
the supercomputer and store them as tarballs in the file system cache,
we need a way to update the database when a new tarball rolls in. For
this, we spawn a second thread that periodically checks the file system
for new files that correspond to a busy entry in the database. When a
corresponding tarball is found, the thread updates the databse, changing
the state for the sequence from busy to done.


You can find the slides of the talk (mostly code)
[here](http://itkovian.net/base/files/talks/ghentfpg-20111004.pdf).


Note that all code was written for Snap 0.5.x and may fail for newer
versions of the framework.
