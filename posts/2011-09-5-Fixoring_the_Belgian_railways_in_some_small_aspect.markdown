-----
Title:  Fixoring the Belgian railways in some small aspect.
Author: Andy Georges
Date: September 5, 2011
----







The Belgian railways are quite well known for the frequent delays
incurred by trains and travelers. The number of trains that do not make
it on time to their destination (and all stations in between) has been
rising steadily over the past few years. The NMBS -- the part of the
railway system that is responsible for the trains -- present figures on
these delays a few times per year. They improve their statistics
somewhat by not counting certain delays, most notably those under five
minutes. At the end points. So the train may still incur delays along
the route, if it arrives on time at the final destination, all is well
according to the stats. I beg to differ.


The real issue is that the statistics are based on trains, not people.
No matter the number of people who will incur a real delay due to their
train not being on time in some station -- either an endpoint of a
transit station -- the NMBS will only count a single instance. To them,
a train that has a delay at, say 2 p.m., is weighted equally with a
delayed rush hour train. Obviously, the latter situation impacts a lot
more travelers: people not making it to a connection train, tram or bus,
or simply getting home later. The problem with connecting trains is that
this may increase the real delay up to one hour or more. And it happens
at minimum once every week.


I agree that the NMBS cannot fix all problems, and in some cases, they
have no say in the matter, since the (old) NMBS has been split into
three parts: the (new) NMBS, the infrastructure controller (Infrabel)
and the holding linking the two. When a train breaks down, or an
accident occurs, it is Infrabel that decides where and when the other
trains will be (re)routed. Yet they have no passenger information
(neither does the NMBS for that matter).


The real goal when solving a problem could take some lessons from
computer science. Let us consider the trains to be processes that
somehow have some dependencies between them. When one process breaks
down or stops, because it has to wait for some data to become available,
the other processes may be impacted since they may need access to some
shared resource that is now being occupied by the stalled process (the
borked train in our analogy). The operating system can then decide to
force the offending process to release the resource (for a while) such
that other processes can continue executing. Now, the analogy is not
completely right, but you catch my drift, I’m sure. How would the OS
decide which process can then take a hold of this shared resource? One
way is to assign priorities to each process and have the process with
the highest priority continue first. In the real world of trains there
is a small (actually, a large) catch. Trains cannot overtake each other,
except at certain well defined places (e.g., a station).


But let us first start with the priorities. How could we assign those to
a train. Actually, there seems to be, IMHO, a quite simple solution for
this. Every passenger needs to have a valid ticket before getting on the
train. How about we change our infrastructure (that would yield jobs!)
and force people to validate their ticket before getting on the
platform. Moreover, you could deny access if their train is not coming
within the next 15 minutes or so, or if there’s a previous train they
cannot take (wrong ticket) still waiting. Since each ticket is used
between two endpoint -- and only very occasionally between the starting
point and a station before the real end point -- this yield information
on how many people are traveling at each moment between any two train
stations. Furthermore, since people tend to take the (theoretically)
fastest route, it is quite predictable which station will be used for
connecting trains (if people need to descend from the platform and
revalidate their ticket, even this poses no issue). Thus, the NMBS (and
by extension, Infrabel) have data on the number of passengers on each
train and on how many people will miss their connecting train if they
incur a delay. Hence, when a problem occurs (not an uncommon event on
the Belgian railways), Infrabel can decide which trains to let pass
first and which ones to (temporarily) put on a side track, such that the
least number of people will be impacted and their overall/maximum delay
will be as small as possible.


A boon of this system is that the NMBS will have objective numbers to
decide how to schedule trains. Right now, they have some vague idea
(commuters are known beforehand, but not the time at which they commute)
and other travelers are mostly known on the moment they purchase a
ticket. But once people are (anonymously) scanned, they gain knowledge.
Patterns may arise (summer holiday travelers going to the coast, etc.)
and trains can be scheduled much more effectively.


The above might not impact the number of trains incurring a delay, but
it should certainly impact the number of affected travelers. While the
former do not complain, the latter do. Quite loudly at times, and
righteously so.
