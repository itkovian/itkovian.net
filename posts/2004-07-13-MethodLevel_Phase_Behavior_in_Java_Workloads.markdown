-----
title:  Method-Level Phase Behavior in Java Workloads.
author: Andy Georges
date: July 13, 2004
paper: yes
description: Finding program bottlenecks by instrumenting the JVM to use HPCs.
tags: java, instrumentation, hardware performance counters, performance, bottlenecks
-----

Diving deeper into the application helps us to understand where bottlenecks
occur that affect performance at the level of the microarchitecture. We observe
subtrees of the call tree and see if their behaviour is significantly worse than
the average program behaviour. We rely on hardware performance counters to
lower the intrusion effects, and only instrument such that perturbation is kept
to a minimum.

$abstract$
