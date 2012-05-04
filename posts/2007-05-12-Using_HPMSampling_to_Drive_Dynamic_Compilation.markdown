-----
title:  Using HPM-Sampling to Drive Dynamic Compilation
author: Andy Georges
date: May 12, 2007
tags: 
-----







The following paper has been acepted for publication at OOPSLA 2007.


**Using HPM-Sampling to Drive Dynamic Compilation**, [Dries
Buytaert](http://buytaert.net/), [Andy Georges](http://itkovian.net/),
[Michael Hind](http://www.research.ibm.com/people/h/hind/), [Matthew
Arnold](http://www.research.ibm.com/people/m/marnold/), [Lieven
Eeckhout](http://www.elis.ugent.be/~leeckhou), and [Koen De
Bosschere](http://www.elis.ugent.be/~kdb).


The paper abstract reads as follows.


All high-performance production JVMs employ an adaptive strategy for
program execution. Methods are first executed unoptimized and then an
online profiling mechanism is used to find a subset of methods that
should be optimized during the same execution. This paper empirically
evaluates the design space of


several profilers for initiating dynamic compilation and shows that
existing online profiling schemes suffer from several limitations. They
provide an insufficient number of samples, are untimely, and have
limited accuracy at determining the frequently executed methods. We
describe and comprehensively evaluate HPM-sampling, a simple but
effective profiling scheme for finding optimization candidates using
hardware performance monitors (HPMs) that addresses the aforementioned
limitations. We show that HPM-sampling is more accurate; has low
overhead; and improves performance by 5.7
18.3
changing the compiler.


Montréal, here we come. October 21st - October 25th it is!


This paper has quite a long history behind it. Dries and I conceived the
idea while attending the [ACACES](http://www.hipeac.net/acaces2006/)
summerschool in July 2006. After a long talk with Mike, we decided to
launch some preliminary measurements with the system Dries had already
built into Jikes RVM using the HPM interface I had adapted from [Steve
Blackburn](http://cs.anu.edu.au/~Steve.Blackburn/)'s [perfctr patch for
Jikes RVM](http://user.it.uu.se/~mikpe/linux/perfctr/). We intially
targetted PLDI 2007, when some matters were brought to our attention,
that questioned our original idea on the current state of the art.
Submission was postponed, extra experiments were conducted and we
targetted VEE instead, where our paper was rejected. Based on the
reviews we received there, it seems like it was a border case, but a
rejection nonetheless. So, we figured, why not submit to OOPSLA. Worst
case scenario: we get additional reviews to improve our paper. I turns
out that the Best Case Scenario was visited upon us instead. You can get
a
[preprint](http://itkovian.net/base/files/papers/oopsla2007-buytaert-preprint.pdf)
version.




