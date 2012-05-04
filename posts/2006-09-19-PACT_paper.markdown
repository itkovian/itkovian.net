-----
title:  PACT paper
author: Andy Georges
date: September 19, 2006
tags: 
-----







I am a co-author for a paper accepted at [PACT
2006](http://www.pactconf.org/), titled "Performance Prediction based on
Inherent Program Similarity", by K. Hoste, A. Phansalkar, L. Eeckhout,
A. Georges, L.K. John and K. De Bosschere. Kenneth Hoste will present it
tomorrow.


The paper abstract reads as follows.


A key challenge in benchmarking is to predict the performance of an
application of interest on a number of platforms in order to determine
which platform yields the best performance. This paper proposes an
approach for doing this.


We measure a number of microarchitecture-independent characteristics
from the application of interest, and relate these characteristics to
the characteristics of the programs from a previously profiled benchmark
suite. Based on the similarity of the application of interest with
programs in the benchmark suite, we make a performance prediction of the
application of interest.


We propose and evaluate three approaches (normalization, principal
components analysis and genetic algorithm) to transform the raw data set
of microarchitecture-independent characteristics into a benchmark space
in which the relative distance is a measure for the relative performance
differences.


We evaluate our approach using all of the SPEC CPU2000 benchmarks and
real hardware performance numbers from the SPEC website. Our framework
estimates per-benchmark machine ranks with a 0.89 average and a 0.80
worst case rank correlation coefficient.


We show that it is possible to make a very good prediction of which
machine will be the best performing machine for an application of which
we know only the microarchitecture independent characteristics. You can
find a pdf of the paper
[here](http://itkovian.net/base/files/papers/hoste06performance_PACT-2006_paper.pdf).




