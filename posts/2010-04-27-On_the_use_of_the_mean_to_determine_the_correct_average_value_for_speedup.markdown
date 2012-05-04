-----
title:  On the use of the mean to determine the correct average value for speedup
author: Andy Georges
date: April 27, 2010
tags: 
-----







I am attending the CGO 2010 conference in Toronto at this moment. I have
seen at least 10 papers pass by that are reporting speedup values over a
number of benchmarks. Nothing wrong there, except for the tiny -- nay,
extremely -- annoying fact that the authors are using the geometric mean
to report average speedup across the benchmark suite.


Let me show with a simple example that this is fubar before giving the
actual reason why it is wrong -- even though the values are not
necessarily off by much, but that is besides the point.


Consider three applications A, B and C, with respective original
execution times 3, 2 and 4 (in a unit of time of your choice). After a
fancy optimisation or whatever, the execution times become 1,1 and 2,
respectively. So, the individual speedup values are (original / new
execution time) and this yields 3, 2 and 2, respectively. Now, if we
were to execute the programs A, B and C one after the other, the total
execution time for the original programs is equal to 3 + 2 + 4, i.e., 9
and the total execution time for the fancy optimised versions is 4.
Hence, the speedup for all the applications is 9/4, which is thus the
average speedup.


So which of the three means would yield this value? Let’s take a look,
shall we? The arithmetic mean of the individual speedup values yields
7/3. The geometric mean yields 12
significant digits) 2.289. The harmonic mean, finally, yields 3 / (1/3 +
1/2 + 1/2) or 9/4. Well well. What an amazing coincidence! So, clearly,
the geometric mean is not yielding the correct value of 2.25.


The reason for this is simple. First of all, the aggregate speedup is
not the product of the individual speedups, so the geometric mean is not
applicable. The arithmetic mean also is not applicable, since the
reference value is found in the denominator.


So, dear CGO authors, the geometric mean is not the right mean to use.
Think on it.
