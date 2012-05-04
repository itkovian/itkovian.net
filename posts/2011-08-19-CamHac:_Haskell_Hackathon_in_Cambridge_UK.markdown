-----
title:  CamHac: Haskell Hackathon in Cambridge, UK
author: Andy Georges
date: August 19, 2011
tags: 
-----







From August 12-14, 2011, Simon Marlow organised a Haskell Hackathon at
Homerton College in Cambridge. Needless to say, several GhentFPG members
were interested to attend. In the end, a party of four (Jeroen Janssen,
Jasper Van Der Jeugt, Bart Coppens and myself) made the crossing to the
UK. It was a smooth ride, even though the train in front of us stopped
in the middle of the Channel Tunnel and we had to wait for about 50
minutes before our train was allowed to proceed.


We stayed at the Cambridge YHA, in a room we shared with Simon Meijer
and some unnamed Belgian guy from Moeskroen, whose Dutch resembled
West-Flemish quite closely. The latter was there to study during the day
and party during the night. And he was not happy with the fact that we
got up around 8:00 AM :-D I only discovered a shower with warm water on
Sunday, having taken cold shower -- I mean really cold -- the previous
two days. But the breakfast more than made up for that.


When signing up to CamHac, I had the plan to work on HaBench, or rather,
look how Fibon could be made into what we envisioned during BelHac as a
Haskell benchmark suite. However, research requirements dictated
otherwise. Given that we are collaborating with researchers from the
KULeuven on a project using COLE and active learning to build models for
the effect of optimisation sequences, and that the COLE framework
requires access to the supercomputer backend at Ghent University, I
decided to write a Haskell web application using Snap that would allow
the submission of optimisation sequences and get the results for the
objective functions (speedup, compilation time, code size, …) back for
the used benchmark suite. Having no previous experience with Snap, I
found the framework to be easy to use. The core of the application was
finished by Sunday afternoon; on the way home I added a watchdog thread
to update the database with finished experiments.


I had a ton of fun those three days, learned a lot, and -- fingers
crossed -- started to grok monads a bit better. The event was full, as
72 people registered. I am not sure everybody turned up, but the room
was crowded at all times. And a lot of work was done, see the
post-hackathon report.
