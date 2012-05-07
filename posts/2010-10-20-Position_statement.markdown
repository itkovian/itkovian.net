-----
title:  Position statement
author: Andy Georges
date: October 20, 2010
description: 
tags: 
-----







Just to open it up and release it into the wild, here’s the statement I
wrote with Koen De Bosschere on several (lower level) aspects of
evaluation in computer science, we would like to see addressed.


Recent work has shown a continued identification of pitfalls in
conducting experimental computer science. In this position statement, we
address three issues we consider important to enhance the
state-of-the-art in this field: (i) the experimental design and setup,
(ii) performance measurements and the subsequent analysis of results,
and (iii) benchmark selection.


First, we consider the experimental setup. When designing an experiment,
there are many dimensions (input set (size), heap size, garbage
collector, compilers, optimisations, different VMs, etc.) to consider.
In the not-so-distant past, researchers often used a single design point
(e.g., a fixed heap size, one garbage collector, etc.). Recently,
however, several researchers made a case in favour of considering
multiple design points, and to let, for example, the heap size vary (in
fixed steps) from a benchmark dependent minimum to a factor thereof.
Essentially, a good experimental design should acknowledge these
dimensions and their importance and make correct decisions with respect
to the design points chosen for any given experiment. Some dimensions
are continuous, others are discrete.


Hence, evaluating all points is not simply infeasible, sometimes it is
outright impossible.


Moreover, the output value (e.g., performance as quantified by execution
time) is not necessarily a continuous function of continuous input
(e.g., heap size). At other times, we are only concerned with a
subspace, i.e., fewer dimensions. This brings us to our first concern.
Some researchers we have discussed these matters with, have stated that
trying to cover the complete design space is pointless, and that they
prefer to pick a single point for evaluating their new shiny idea. We
beg to differ, but it is clear that the community needs to agree on
which design points to used to obtain representative measurements.


Other scientific communities have since long solved the problem of
experiment design. For example, in medical and social sciences, taking a
representative (random) sample of the population follows a well known
and widely practiced methodology. We do not believe that simply adopting
these techniques is the way to go, but we can definitely learn from
their methodology. We need to carefully examine how the experiment’s
design space is shaped and which statistical techniques have to be used
for choosing the correct (in some sense) points in it. For this,
techniques borrowed from the machine learning community might be
employed, where researchers choose data points that have most impact on
a model they wish to build. Clearly, we need to pick more points from
regions in the design space where the output function (e.g.,
performance) changes rapidly or where it is discontinuous.


The second issue involves measurement and analysis of data. Computer
systems tend to exhibit mildly chaotic behaviour, e.g. programs may
behave non-deterministically. We have argued in the past to add more
statistical rigour to measurements and data analysis. It seems that the
community is slowly embracing this idea, but there are a few obstacles
holding researchers and practitioners back. In our opinion, there are at
least two issues that must be addressed. The first and foremost problem
is the lack of frameworks that automate the hard work -- nobody likes
boilerplate. Second, doing elaborate experiments takes time and
resources. Computing resources are often scarce. Even when an experiment
is embarrassingly parallel, researchers do not always have the resources
required to exploit (most of) this parallelism. Automation is the key to
solving these problems, yet any approach must be fully aware of the
pitfalls we uncovered and deal with them adequately. A good example to
follow is the recently developed Criterion framework, used by the
Haskell community.
([http://www.serpentine.com/blog/2009/09/29/criterion-a-new-benchmarking-l](http://www.serpentine.com/blog/2009/09/29/criterion-a-new-benchmarking-l)...).
It improves on our own work in several respects, e.g., identifying the
impact of outliers on the variance, determining the required number of
iterations and the number of experiments to be conducted. It is usable
for both micro and macro-benchmarks. The community should adopt these
practices, and take them to the next level: non-normal distributed
measurements, check autocorrelation, etc.


Third, concerning benchmark suites, there are two issues we will briefly
discuss. Current benchmarks suites are sets (in the mathematical sense)
of programs and their inputs. We propose to add an (objective) ordering
to these sets, for example how much each benchmark adds to the coverage
of the space of computer programs, spanned by some (again, objective)
metrics. Ideally, these metrics should be machine and language
independent, though this seems hard to achieve. Reducing the demands, we
can start with a set of micro-architecture independent metrics, and see
how well programs from different language map in the space. When for
some reason a subset is used, the experiment should always include the
top ranked benchmark, without skipping benchmarks. In such a scenario,
it seems necessary to define the minimum number of benchmarks that
should be evaluated, e.g., k 
those benchmarks, we require the code and setup to be made public such
that reviewers and potential users can evaluate further.


The second important issue -- closely linked to the benchmark ordering
-- involves deciding when an experiment shows positive evidence for the
evaluated technique or innovation. Currently, reviewers check the mean
(often the wrong one) and see if the approach works for (at least some
of) the benchmarks. Now, if the benchmarks are both characterised and
ordered, one can see for which regions the innovation works, thus
showing that it is in fact useful for a (limited) class of programs --
compare this to a drug that works for 70% of a population.


It is time to place experimental computer science on solid grounds with
respect to both the design of an experiment as well as its measurement
and evaluation. This requires the following steps. First, gauge the
width and depth of the problem by uncovering all pitfalls. Then, provide
researchers with tools and sound methodologies to conduct experiments.
