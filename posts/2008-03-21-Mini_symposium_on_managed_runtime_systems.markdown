-----
title:  Mini symposium on managed runtime systems
author: Andy Georges
date: March 21, 2008
tags: 
-----







On April 11th, 2008, after my internal PhD defense has taken place, two
of my jury members will give a talk. If you are interested, can join us
in the Jozef Plateauzaal in the Faculty of Engineering building,
Plateaustraat 22, in Ghent. The first talk will be given by Matthias
Hauswirth (University of Lugano, Switzerland) and is titled *Observer
Effect and Measurement Bias in Performance Measurement*. The second talk
is by Kathryn McKinley (University of Texas at Austin, USA), is titled
*Dynamic Bug Detection for Managed Languages*. The event starts at
14:30, and each talk will take about one hour of with 15 minutes are
reserved for questions and such.


**Observer Effect and Measurement Bias in Performance Measurement**


To evaluate an innovation in computer systems, performance analysts
measure execution time or other metrics using one or more standard
workloads (e.g., the SPEC benchmarks). The performance analyst may
carefully minimize the amount of measurement instrumentation, control
the context in which measurement takes place, and repeat each
meas-urement multiple times. Finally, the performance analyst may use
the appropriate statistical techniques to characterize the data.
Unfortunately, even with such a responsible approach, the collected data
may or may not be actually useful. In this talk we show how easy it is
to produce poor (and thus misleading) data in computer systems research.
We explore two common sources of poor-quality data. First, we get
poor-quality data if our data collection perturbs the behavior of the
system that we are measuring; this is often known as the "observer
effect". We show that even a seemingly insignificant measurement probe
can dramatically alter system behavior; thus, perturbation is much more
common than most performance analysts probably realize. Second, we get
poor-quality data if we measure the system in a particular set of
contexts and that set does not capture the range of reasonable contexts
that a user of the system might encounter; this is known as "measurement
bias". We show that different contexts favor different configurations of
the system. We conclude our talk by outlining techniques for producing
high-quality data.


**Dynamic Bug Detection for Managed Languages**


Although managed languages preclude and help prevent some software
errors, deployed programs still have errors and crash. In this talk, we
discuss approaches for detecting bugs and making deployed software more
reliable. Our work focuses on efficient on-line techniques. We overview
approaches for detecting the source of null pointer exceptions and
efficiently computing calling context. We present an approach for
detecting data structures that are growing. We show how to piggyback on
the garbage collector to summarize efficiently (in time and space) the
object volumes and relationships based on their user defined class.
Experimental results show this approach is effective at finding memory
leaks, i.e., data structure errors of omission. We include a brief
discussion of in progress work on tolerating leaks. These results
indicate promise for inexpensive approaches that help developers find
bugs and protect users from their consequences.


You can find a PDF of the announcement
[here](http://itkovian.net/base/files/mrt-symposium.pdf). For your
convenience, I have put together a
[map](http://itkovian.net/base/files/mrt-symposium-map.pdf).


Here are the short biographies of the speakers.


**Matthias Hauswirth**


He is an assistant professor at the University of Lugano in Switzerland.
He is interested in approaches for measuring, understan-ding, and
improving the performance of modern, complex systems. He is particularly
intrigued by the intricate interactions between the different system
layers, from the hardware, over the operating system, virtual machine,
application frameworks, all the way to the applications.


**Kathryn McKinley**


She is a professor at the University of Texas. Her research interests
include compiler optimization, architecture, memory management, and
software engineering. She is currently serving as the Editor-and-Chief
of TOPLAS and has been the program chair of ASPLOS, PACT and PLDI. She
has graduated eight PhD students and is currently supervising eight
graduate students.




