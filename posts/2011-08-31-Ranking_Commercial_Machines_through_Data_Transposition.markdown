-----
Title:  Ranking Commercial Machines through Data Transposition
Author: Andy Georges
Date: August 31, 2011
-----







The following paper has been accepted for publication at IISWC 2011
(IEEE International Symposium on workload Characterization).


Ranking Commercial Machines through Data Transposition, Beau Piccart,
Andy Georges, Hendrik Blockeel, Lieven Eeckhout.


The abstract of the paper reads as follows.


The performance numbers reported by benchmarking consortia and
corporations provide little or no insight into the performance of
applications of interest that are not part of the benchmark suite. This
paper describes data transposition, a novel methodology for addressing
this ubiquitous benchmarking problem. Data transposition predicts the
performance for an application of interest on a target machine based on
its performance similarities with the industry-standard benchmarks on a
limited number of predictive machines. The key idea of data
transposition is to exploit machine similarity rather than workload
similarity as done in prior work, i.e., data transposition identifies a
predictive machine that is most similar to the target machine of
interest for predicting performance for the application of interest.


We demonstrate the accuracy and effectiveness of data transposition
using the SPEC CPU2006 benchmarks and a set of 117 commercial machines.
We report that the machine ranking obtained through data transposition
correlates well with the machine ranking obtained using measured
performance numbers (average correlation coefficient of 0.93). Not only
does data transposition improve average correlation, we also demonstrate
that data transposition is more robust towards outlier benchmarks, i.e.,
the worst-case correlation coefficient improves from 0.59 by prior art
to 0.71. More concretely, using data transposition to predict the top-1
machine for an application of interest leads to the best performing
machine for most workloads (average deficiency of 1.2
deficiency of 24.8
deficiencies over 100


You can get a
[preprint](http://itkovian.net/base/files/papers/papers.iiswc2011.submission.pdf)
of the paper (subject to change for the final submitted version).
