-----
Title:  WCET analysis
Author: Andy Georges
Date: July 14, 2009
----







One of the courses I am attending deals with worst case execution time
analysis or WCET analysis for short.


[![image](B76A013B-0CFB-476A-A481-05F0E2231B04-1.jpg)](http://www.flickr.com/photos/itkovian/3715683959/)


I think that the following are the main points of interest


href="http://www.vmars.tuwien.ac.at/people/puschner.html"
Puschner


tried to get drilled into our skulls. The course focuses on the worst
case


analysis, and for that there are three major items one needs to take
into


account: the piece of code to analyse, the input it consumes and the
hardware


it runs on. Giving the fact the most code consumes input means that
there is


some state associated with it, that determines the paths takes in the
static


code graph. Peter clearly stated that the input should be part of the
problem


specification, which often complicates the analysis. Additionally, the
hardware


has some associated state as well (think caches, branch prediciton,
etc.) that


influences the timing of each task we want to analyse. Different
instances of


actions in the task have different durations, and as such the sequence
of the


actions carries out during each task becomes the important factor. It
was


clearly illustrated that measurements are not adequatefor dealing with
worst


case scenario's. I think the lesson to take away from the first class is
that


there is no way to measure WCET, one must therefore analyse the program.


The second lesson dealt with a number of approaches for determining the
WCET:


tree-based (from the program graph), path-based (potential dynamic
execution


paths), and IPET based. Tree-based WCET does not scale well, path=based
does,


but that has the disadavantage of getting quite complex as the program
size


increases. To deal with this, the IPET technqiue can be used, in which
we


desribe the flow of control by using a number of equations that
constrain the


possibilities: program flow going ionto a node, must come out of it, so
this


yields a number of equations that state how many times an edge can be
taken.


The drawback here is that solving the equation using ILP is NP hard in
general.


Another technique discussed was the modelling of execution time by
mapping a


sequence of instructions to an execution time. This however requires


information on the hardware timing to deal with the various hardware


enhancements to the processor (think pipelines, caches, out=of-order
execution,


...). I think this seems to have quite some non-deterministic aspects.
Peter


then moved on to show how one can model pipelines, to be used in the
WCET


analysis, as well as how one can model caches within the IPET framework.
The


takeway lesson here is that there is no straighforward technique to
estimate


the WCET, and the most powerful techniques must use hardware timing


information, which is a hard problem in itself.


The third lesson dealt almost exclusively with the modeling of the
caches,


moving from a concrete state to an abstract state, which can be reasoned
about.


Peter identified 4 essential categories for the analysis in a cache
model:


always hit, always miss, globally persistent, locally persistent, plus
one


leftover category. For each of these categories, there is a different
semantics


for the start state, the update function and the join function on the
abstarct


cache model. Finally, we received an introduction to potential timing
anolalies


that can occur and how to deal with those.


In the fourth lesson, the focus moved to measuring execution times. Here
the


key takeway was that it is very unlikely that the hardware will be set
to the


worst case state for executing the application, leading to (at times
gross)


underestimates of the WCET. For a WCET bound, more systematic techniques
are


required. One of the best performing WCET measurements tools relies on
genetic


algorithms for generating the input that drives the WC scenario. Still,
for the


benchmarks shown, there can be quite a large discrepancy between the


analytically obtained WCET and the WCET obtained through use of a GA.
Other


potential techniques include a probabilisitc approach and program
segmentation


with a path based analysis.


In the final class on Friday, Peter discussed some issues with
time-predicatble


sofware and hardware. Predicates, transforming execution paths, etc. can
be


used to get more reliable WCET bounds. The major takeaway here was that
the


classical analysis where one focuses on the mean execution time (with
its


distribution, like we did in


href="http://www.itkovian.net/base/statistically-rigorous-java-performance-evaluation"


Java stats paper at [OOPSLA](http://www.ooplsa.org/)) is not


going to work at all for a WCET analysis. Peter also argued for better
WCET


bounded hardware, or at least hardware that could make the WCET analysis


easier.


[![image](B76A013B-0CFB-476A-A481-05F0E2231B04-2.jpg)](http://www.flickr.com/photos/itkovian/3729256016/)




