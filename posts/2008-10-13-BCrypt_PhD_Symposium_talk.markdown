-----
title:  BCrypt PhD Symposium talk
author: Andy Georges
date: October 13, 2008
description: 
tags: 
-----







I was invited by [prof. Ingrid
Verbauwhede](http://homes.esat.kuleuven.be/~iverbauw/) to give a talk at
the [Second BCrypt PhD
Symposium](https://www.cosic.esat.kuleuven.be/bcrypt/announcements.php#news_24).
The idea was to explain a few things about hardware performance
counters, and how they are used nowadays and how they might be used to
attack implementations of cryptographical algorithms.


The abstract of the talk reads as follows.


What Can We Learn Using Hardware Performance Monitors on Modern
Microprocessors?


Modern microprocessors are ingenious pieces of technology, delivering
tremendous amounts of computing power. Because of the complex design of
current microprocessors, it is hard to understand how programs behave on
them, how they attain the observed performance and what possible
bottlenecks need to be dealt with. Usually, exploratory architectural
simulation is used prior to implementing a design. However, once the
chip has been built, such techniques provide little help to quickly gain
insight into the actual behaviour of a program that executes on it: (i)
although it can be massively parallelised, simulation remain several
order of magnitude slower than execution on real hardware, while the
simulated programs grow ever larger (both in memory footprint and in the
number of instructions that are executed) during a (typical) run, (ii)
getting a simulator to be cycle-accurate is a very complex problem.
Moreover, to deliver high performance, a microprocessor contains a lot
of components that are not necessary to ensure correct functional
behaviour, such as caches, branch prediction, etc.


Benchmarking is one of the fundamental concepts in experimental computer
science. Assessing the performance of a microprocessor running a number
of benchmarks -- or vice versa, understanding the performance of
programs -- is very important to enhance technology and validate
research. For this reason, modern microprocessors are equipped with
performance monitoring hardware. These monitors count the events as they
occur in the processor during the execution of a program, for example
the number of data cache misses, mispredicted branches, etc. This allows
a researcher to identity commonly occurring events, and adapt his
programs, tool chain, etc. to improve their performance in that aspect.


In this talk we will focus on the design of a modern super-scalar
out-of-order processor, and the various components that allow it to
operate with high performance. We will explain how the performance
monitoring infrastructure can be used for gaining insight in the
execution of a program. Because performance counters can leak
information about the behaviour of a program, they can also be used as a
side-channel to attack implementations of cryptographic algorithms. We
will briefly outline an example of such an attack.


I have exported the Keynote presentation into [a pdf
file](http://itkovian.net/base/files/bcrypt-presentation-200813.pdf)
(8.9MB). It might not make too much sense without the explanation I
would add when presenting, but you might learn a thing or two
nonetheless. I hope ;-)


The event took place in the Arenberg Castle:


[![image](80508683-4338-44D5-BF63-4D4754291C4E-1.jpg)](http://www.flickr.com/photos/itkovian/2938247852/)


Coffee was served in a hall, where people long dead keep staring at you
with jealous eyes that see all the delicious food pass by:


[![image](80508683-4338-44D5-BF63-4D4754291C4E-2.jpg)](http://www.flickr.com/photos/itkovian/2937396257/)


I must confess I understood little of the real cryptographical mojo
people were preaching about;-)




