-----
title:  Performance, scalability, and real-time response from the Linux kernel
author: Andy Georges
date: July 20, 2009
tags: 
-----







The most interesting course, as well as the one I enjoyed most, was on
the


performance, scalability and real-time response of the Linux kernel.


[![image](A06503A9-805E-46AA-BD9A-38C1A25E85F4-1.jpg)](http://www.flickr.com/photos/itkovian/3717236440/)


He opened the course by dropping a question into the unsuspecting
audience:


what decades old tech can keep a multi-core busy and yet be easy to
program


against. I thought Paul had the idea of a time-sharing machine in his
mind, but


the solution was far easier than that: SQL. Given that the frequency
increase


of the CPUs is stabilising at naught, we need to find a good way to
easily


program against multi-core architectures. Something that rivals the ease
of


SQL, where under the hood a lot of stuff is going on, but to the user,
it


remains fairly simple. Unlike most of the other people talking about


parallelism, Paul stressed multiple times that if one does not need it,
it's


best to run single threaded. I wholeheartedly agree! On the other hand,
if we


parallelise, we should be considering high-level approaches prior to
trying to


get the nitty-gritty details right. So, first: get your algorithm in
shape. I


think that's a very good point, given the fact that research papers
publishing


tweaks, rather than new algorithms seldom succeed in increasing the
performance


with a factor or even a large percentage. Conversely, any performance
lost at


the base OS level, cannot be made up by the higher levels, no matter the


algorithm. Context-switches, locks, etc. take a (more-or-less) fixed
amount of


time, and that time will be spent anyhow.


The major issue with RT-processes seems that they need to interact with
non-RT


processes, I/O (disk, network, etc.). As such, the RT approach has to be


applied across the entire execution stack, if we want to gdet it right.


However, we still need to keep a fair responsiveness for non-RT
processes.


Essentially, Paul argues for making tradeoffs, rather that going for the


best-for-a-single-goal apporoach and ignore the rest.


The question raised was why we need to enhance performance. The answer
is that


people time is much more costly than machine time these days. So it does
no


lomnger pay off to get an engineer trying to enhance the solution. It
should be


done automnagically as much as possible. Moreover, general solutions
help to


spread the cost over multiple users.


One of the major problem when parallelising programs is that people
either do


not grok the issues fully, or try to tackle the problems in the wrong
order.


Paul argued that we first need to understand how we can split up the
problem


into parts where there is little interaction between the data (as to
avoid


excess locking). Only then can we partition the work that is done on
that data.


The final step then is to determine which parts can have actual access
to the


data, i.e., assign the locks. The matra that was repeated here was that


low-level details really do matter, and that it is important to get them
right.


Building on this, the argument was raised what we rely on people who
implement


things to have detailed knowledge of the underlying hardware.
Unfortunately,


this is not always the case.


The takeaway lesson from the first lecture was this: parallel
programming is


bloody hard, because it was designed that way.


Lesson 2 discussed Linux kernel programming environments dealing with:
response


times, preemption inside the kernel, non-maskable interrupts, etc. Point
made:


if an algorithm runs at a low level, you need interruptible locks. The
kernel


comes with a broad aaray of synchronisation primitives, so it is
important to


use the right primitives for the right job. For example, use locks that
allow


looping in the reader if there are potentially (multiple) writers. Once
more,


Paul stressed that synchronisation primitivies are not the first thing
to


decide on. We should associate locks and other primitives with each data


partition (that was agreed upon earlier in the design stage). Clearly,
it is


not good to have too many data partitions, as that means more locks, and
a


higher risk of lock contention. The example used throughout this lesson
was


that of a linked list. Should we lock the header? Lock each node? Keep
the


locks in the data structure or in some hash array of locks? Key point:
provide


protection for each way in which the data can be accessed! A per-cpu
locking


mechanism can be used; if done right it scales pretty well.


In lesson 3, Paul tackled the performance and scalability of Linux


applications. Most frameworks (200+) that we once in use have now either
faded,


merged, or discontinued. Advice is given not to use or rely on signal
handlers.


POSIX primitives were discussed, as were per-thread variables,
spinlocks, etc.


Important point was that the use of per-cpu state to lock onto, does not


translate well from kernel to user space. Some remarks were made about
the RT


aspects of user-space applications. Should this be enforced? The issue
here is


that opening RT behaviour to user-space clears the way for abuse. During
the class, he used the (adapted) illustration of the blind philosophers
and the elephant:


[![image](A06503A9-805E-46AA-BD9A-38C1A25E85F4-2.jpg)](http://www.flickr.com/photos/itkovian/3724554811/)


Lesson 4 was fully dedicated to real time systems, discussing some of
the


implementations in the Linux kernel for dealing with this. Main topics
of the


day were timers, high-resolution and others, interrupt handlers that can
be


threaded, etc. It was stressed that real time has a broad range of
meanings,


going from a few nanoseconds up to 10ms, the latter amounting basically
to the


context switch time. Apparently, as a first step, some parts of the
kernel can


be preempted, some cannot. The consequence is a reduction of schedular
latency,


but nowhere near enough for a RT system at the hiogh end of the scale.
Timer


wheels were added to improve locality and queueing, but still certain
cascading


operations on this data structure can take a long time. Long enough to
warrant


implementing high-resolution timers using RB trees, along with
preemptible


spinlocks. Still: greater power means greater responsibility, so care
must be


taken. Priority inversion was discussed, and adequaltely illustrated
using the


dancing processes.


[![image](A06503A9-805E-46AA-BD9A-38C1A25E85F4-3.jpg)](http://www.flickr.com/photos/itkovian/3727450809/)


RCU once more came to the rescue, and it was shown how this can be used
in the RT scenario, with priority inversion.


In the final lesson, Paul discussed RT Linux applications.


[![image](A06503A9-805E-46AA-BD9A-38C1A25E85F4-4.jpg)](http://www.flickr.com/photos/itkovian/3728456171/)


I guess the above illustration really says it all. The class discussed
the


meaning of a hard RT system, and most of use were proven wrong. In some
cases


knowing that failure is imminent is more important that guaranteed
making the


deadline. (This eems to have some resemblance to writing research
papers.) A


combination of an accurate system that is allowed to fail and can
indicate it


with a less accurate systemn that guarentees deadline meeting seems to
be the


way to go. In any case, maths cannot describe RT systems in practive,
and QoS


is more important that hard/soft RT distinction.


RT applications can be divided into three classes: search for life


(medical/industrial control systems), search for death (military) and
search


for money (financial). In todays interconnected machine web, the slowest


machine determines the RT nature of the complete system. Multiple
serialised


machines have a large impact on this fact. Funny fact: in the Linux
kernel,


real time used to mean real life time, rather than deadline meeting. So
beware


of the code you rely on!




