-----
title:  Code Generation and Optimisation
author: Andy Georges
date: April 28, 2010
tags: 
-----







I have had the pleasure to attend the conference on Code Generation and
Optimisation this week in Toronto, where Kenneth Hoste presented our
paper. The conference was pretty amazing. I must admit that compilers
and such are not my forte (at least, the nitty gritty details are not),
but there were a number of talks that really stood out IMO.


To begin with, Ben Zorn’s keynote “Performance is dead, long live
performance”. I’ll never be best friends with Microsoft, but the talk
was very interesting and overall, Ben’s cool. In the talk Ben showed
that people have been losing focus on performance, shifting to
correctness over the past 5-10 years. This was in stark contrast to the
1990’s where papers really focused on performance. This seems like an
important trend, but, as the title reveals, performance is still
important, even if not the most prominent item. The reason is that
performance sells. People use tools and gadgets that have good
performance (the comparison between the iPhone and a Windows Mobile
phone was made, guess who won?). The important point was here that there
is a tradeoff. People are willing to sacrifice performance for security
and vice versa.


In the second keynote talk, CJ Newburn showed that there are two sides
to heterogeneity: we have the system, and the tool infrastrcuture. The
former, we want to make heterogeneous, but we do not want to have it
visible to the user, i.e., the infrastructure should paint a homogeneous
picture. The examples given include the various extensions to the ISA
that have made their way into the CPU core, starting from floating point
operations to SSE. The most important takeaway was that the masses want
it simple, since the broad base of programmers focus oh what to do, not
how to do it. So there should be a homogeneous interface, but also hooks
to each of the underlying heterogeneous components such that skilled
programmers can get down and dirty.


The first talk was also the winner of the best paper award: PinPlay, on
a replay system on top of PIN. I do not know at this point if I agree
with this setup, but the work seems pretty impressive. It was presented
by Christiano Pereira. The tool aims to capture a number of events,
including thread scheduling and system call results. Supposedly it is OS
agnostic, and HW agnostic, so application can be recorded on one
platform and replayed on another platform. This does need some extra
support, for example, to address different thread scheduling mechanisms
across OSses. There were three major use cases: (1) checkpointing and
sampling for simulation, (2) sharing workloads between people, by
providing the logs and let the other party replay the application, and
(3) debugging purposes. The authors also claimed it is possible to
re-log, i.e., to record an execution during replay. I wondered if it
would be possible to use the tool in such a way that bugs due to
parallelism could be detected, since the tool itself has quite a large
time-overhead. This can cause Heisenbugs to be invisible during the
recording phase. However, if it would be possible to reduce overhead by
recording only the thread interactions, such that the bug can manifest
itself, and record the rest of the execution during the replay, I think.


The second talk I was really impressed with was on An Efficient Software
Transactional Memory Using Commit-Time Invalidation, presented by Justin
Gottschlich. He’s a very good presenter, and went through the story with
heaps of enthusiasm. The bottom line is that one should have committing
transactions invalidate, rather than validate. This means that instead
of checking all reads and occasionally checking the writes, the
transaction should check it’s writes and see if others are reading these
elements. Then, there is no need to check the reads. Apparently, this is
not always a win over validation, but when it does win (in highly
contending workloads), it wins big time.


After the last session, the winner -- or should I say winners, as there
was a tie -- of the best presentation award were chosen by vote of the
remaining attendees. The two winners were Justin Gottschlich and Jason
Mars. The former really is the better salesman, but the latter was
holding up pretty well.


Outside of the technical program, I have learned at least one cool
concept. When going to a restaurant, ask for a surprise. I think (if
there’s nothing you really loathe on the menu) a great idea. Moreover I
was introduced to it by Tipp Moseley, a very cool frood. Certainly one
who knows where his towel is :-)


On the day of the return to the country still known as Belgium, we
visited the CN Tower. I can be quite short here: totally mindblowingly
awesome. It took me a few seconds before I dared to step onto the glass
floor, but once on there, looking down was an amazing experience. After
that, there was a slight rush to the airport. Both Kenneth and I did not
manage to sleep much, if at all, and it was killing to stay awake at
Schiphol while waiting for our connecting flight to Brussels.


All in all, it was very interesting, and I’m really looking forward to
next year’s CGO. Chamonix, here we come!
