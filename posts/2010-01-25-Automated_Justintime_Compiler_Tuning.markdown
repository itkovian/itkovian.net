-----
Title:  Automated Just-in-time Compiler Tuning
Author: Andy Georges
Date: January 25, 2010
----







I'm pretty excited about our paper to get accepted at CGO 2010, which
takes place in Toronto, Canada.


Automated Just-in-time Compiler tuning, [Kenneth
Hoste](http://www.elis.ugent.be/~kehoste), [Andy
Georges](http://itkovian.net/base), and [Lieven
Eeckhout](http://www.elis.ugent.be/~leeckhou).


The abstract of the paper reads as follows.


Managed runtime systems, such as a Java virtual machine (JVM), are
complex pieces of software with many interacting components. The
Just-In-Time (JIT) compiler is at the core of the virtual machine,
however, tuning the compiler for optimum performance is a challenging
task. There are (i) many compiler optimizations and options, (ii) there
may be multiple optimization levels (e.g., -O0, -O1, -O2), each with a
specific optimization plan consisting of a collection of optimizations,
(iii) the Adaptive Optimization System (AOS) that decides which method
to optimize to which optimization level requires fine-tuning, and (iv)
the effectiveness of the optimizations depends on the application as
well as on the hardware platform. Current practice is to manually tune
the JIT compiler which is both tedious and very time-consuming, and in
addition may lead to suboptimal performance.  This paper proposes
automated tuning of the JIT compiler through multi-objective
evolutionary search. The proposed framework (i) identifies optimization
plans that are Pareto-optimal in terms of compilation time and code
quality, (ii) assigns these plans to optimization levels, and (iii)
fine-tunes the AOS accordingly. The key benefit of our framework is that
it automates the entire exploration process, which enables tuning the
JIT compiler for a given hardware platform and/or application at very
low cost.  By automatically tuning [Jikes RVM](http://jikesrvm.org/)
using our framework for average performance across the
[DaCapo](http://dacapobench.org/) and
[SPECjvm98](http://www.spec.org/jvm98) benchmark suites, we achieve
similar performance to the hand-tuned default Jikes RVM. When optimizing
the JIT compiler for individual benchmarks, we achieve statistically
significant speedups for most benchmarks, up to 40% for start-up and up
to 19% for steady-state performance. We also show that tuning the JIT
compiler for a new hardware platform can yield significantly better
performance compared to using a JIT compiler that was tuned for another
platform. 


You can get a
[preprint](http://itkovian.net/base/files/papers/cgo2010-hoste-preprint.pdf)
of the paper. We also plan to make our tool available, so it can be used
to automagically tune other VMs 
