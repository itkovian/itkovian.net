-----
title:  Method-Level Phase Behavior in Java Workloads.
author: Andy Georges
date: July 13, 2004
description: 
tags: 
-----







The following paper has been accepted for publication at OOPSLA 2004


Method-Level Phase Behavior in Java Workloads, [Andy
Georges](http://itkovian.net/), [Dries Buytaert](http://buytaert.net/),
[Lieven Eeckhout](http://www.elis.ugent.be/~leeckhou), and [Koen De
Bosschere](http://www.elis.ugent.be/~kdb)


The paper abstract reads as follows.


Java workloads are becoming more and more prominent on various computing
devices. Understanding the behavior of a Java workload which includes
the interaction between the application and the virtual machine (VM), is
thus of primary importance during performance analysis and optimization.
Moreover, as contemporary software projects are increasing in
complexity, automatic performance analysis techniques are indispensable.
This paper proposes an off-line method-level phase analysis approach for
Java workloads that consists of three steps. In the first step, the
execution time is computed for each method invocation. Using an off-line
tool, we subsequently analyze the dynamic call graph (that is annotated
with the method invocations
phases. Finally, we measure performance characteristics for each of the
selected phases. This is done using hardware performance monitors. As
such, our approach allows for linking microprocessor-level information
at the individual methods in the Java application
is extremely interesting information during performance analysis and
optimization as programmers can use this information to optimize their
code. We evaluate our approach in the Jikes RVM on an IA-32 platform
using the SPECjvm98 and SPECjbb2000 benchmarks. This is done according
to a number of important criteria: the overhead during profiling, the
variability within and between the phases, its applicability in Java
workload characterization (measuring performance characteristics of the
various VM components) and application bottleneck identification.




