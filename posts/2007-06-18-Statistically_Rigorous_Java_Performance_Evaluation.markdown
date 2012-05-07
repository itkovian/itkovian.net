-----
title:  Statistically Rigorous Java Performance Evaluation
author: Andy Georges
date: June 18, 2007
description: 
tags: 
-----







The following paper has been accepted for OOPSLA 2007.


Statistically Rigorous Java Performance Evaluation, [Andy
Georges](http://itkovian.net/), [Dries Buytaert](http://buytaert.net/),
and [Lieven Eeckhout](http://www.elis.ugent.be/~leeckhou).


The abstract reads as follows.


Java performance is far from being trivial to benchmark because it is
affected by various factors such as the Java application, its input, the
virtual machine, the garbage collector, the heap size, etc. In addition,
non-determinism at run-time causes the execution time of a Java program
to differ from run to run. There are a number of sources of
non-determinism such as Just-In-Time (JIT) compilation and optimization
in the virtual machine (VM) driven by timer-based method sampling,
thread scheduling, garbage collection, and various system effects.


There exist a wide variety of Java performance evaluation methodologies
used by researchers and benchmarkers. These methodologies differ from
each other in a number of ways. Some report average performance over a
number of runs of the same experiment; others report the best or second
best performance observed; yet others report the worst. Some iterate the
benchmark multiple times within a single VM invocation; others consider
multiple VM invocations and iterate a single benchmark execution;


yet others consider multiple VM invocations and iterate the benchmark
multiple times.


This paper shows that prevalent methodologies can be misleading, and can
even lead to incorrect conclusions. The reason is that the data analysis
is not statistically rigorous. In this paper, we present a survey of
existing Java performance evaluation methodologies and discuss the
importance of statistically rigorous data analysis for dealing with
non-determinism. We advocate approaches to quantify startup as well as
steady-state performance, and, in addition, we provide the JavaStats
software to automatically obtain performance numbers in a rigorous
manner. Although this paper focuses on Java performance evaluation, many
of the issues addressed in this paper also apply to other programming
languages and systems that build on a managed runtime system.


This paper took quite some work, especially in the experimentation-wise.
While the initial reviews were very positive, they required us to
perform several extra experiments. But in the end, it was worth the
effort. You can get a
[preprint](http://itkovian.net/base/files/papers/oopsla2007-georges-preprint.pdf)
version.


So, 2 out of X at OOPSLA for us! Yay!




