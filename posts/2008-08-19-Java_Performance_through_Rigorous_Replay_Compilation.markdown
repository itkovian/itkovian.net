-----
Title:  Java Performance through Rigorous Replay Compilation
Author: Andy Georges
Date: August 19, 2008
----







At this year's [OOPSLA](http://oopsla.org/oopsla2008/) I am going to
present a paper that was accepted in the Research Papers track.


Java Performance Evaluation through Rigorous Replay Compilation, [Andy
Georges](http://itkovian.net/), and [Lieven
Eeckhout](http://www.elis.ugent.be/~leeckhou), [Dries
Buytaert](http://buytaert.net/)


The abstract of this paper reads as follows.


A managed runtime environment, such as the Java virtual machine, is
non-trivial to benchmark. Java performance is affected in various
complex ways by the application and its input, as well as by the virtual
machine (JIT optimizer, garbage collector, thread scheduler, etc.). In
addition, non-determinism due to timer-based sampling for JIT
optimization, thread scheduling, and various system effects further
complicate the Java performance benchmarking process.


Replay compilation is a recently introduced Java performance analysis
methodology that aims at controlling non-determinism to improve
experimental repeatability. The key idea of replay compilation is to
control the compilation load during experimentation by inducing a
pre-recorded compilation plan at replay time. Replay compilation also
enables teasing apart performance effects of the application versus the
virtual machine.


This paper argues that in contrast to current practice which uses a
single compilation plan at replay time, multiple compilation plans add
statistical rigor to the replay compilation methodology. By doing so,
replay compilation better accounts for the variability observed in
compilation load across compilation plans. In addition, we propose
matched-pair comparison for statistical data analysis. Matched-pair
comparison considers the performance measurements per compilation plan
before and after an innovation of interest as a pair, which enables
limiting the number of compilation plans needed for accurate performance
analysis compared to statistical analysis assuming unpaired
measurements.


The bulk of this paper made up Chapter 5 in my PhD dissertation, which
was published on April 30, 2008. Here and there slight improvements were
made before we submitted the final version. You can get a
[preprint](http://itkovian.net/base/files/papers/oopsla2008-georges-preprint.pdf)
version of the paper. The presentation I gave is available in both
[pdf](http://itkovian.net/base/files/papers/oopsla2008-georges-presentation.pdf)
format or as a [zipped
Keynote](http://itkovian.net/base/files/papers/oopsla2008-georges-presentation.zip)
archive.




