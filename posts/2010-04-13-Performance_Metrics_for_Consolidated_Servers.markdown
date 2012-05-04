-----
Title:  Performance Metrics for Consolidated Servers
Author: Andy Georges
Date: April 13, 2010
----







The following paper got accepted for the [HPCVirt 2010
workshop](http://www.csm.ornl.gov/srt/conferences/hpcvirt2010/), taking
place in Paris, France (duh).


Performance Metrics for Consolidated Servers, [Andy
Georges](http://itkovian.net), and [Lieven
Eeckhout](http://www.elis.ugent.be/~leeckhou).


The abstract of the paper reads as follows:


In spite of the widespread adoption of virtualization and consol-
idation, there exists no consensus with respect to how to bench- mark
consolidated servers that run multiple guest VMs on the same physical
hardware. For example, VMware proposes VMmark which basically computes
the geometric mean of normalized throughput values across the VMs; Intel
uses vConsolidate which reports a weighted arithmetic average of
normalized throughput values.


These benchmarking methodologies focus on total system through- put
(i.e., across all VMs in the system), and do not take into account
per-VM performance. We argue that a benchmarking methodology for
consolidated servers should quantify both total system through- put and
per-VM performance in order to provide a meaningful and precise
performance characterization. We therefore present two performance
metrics, Total Normalized Throughput (TNT) to characterize total system
performance, and Average Normalized Reduced Throughput (ANRT) to
characterize per-VM performance.


We compare TNT and ANRT against VMmark using published performance
numbers, and report several cases for which the VM- mark score is
misleading. This is, VMmark says one platform yields better performance
than another, however, TNT and ANRT show that both platforms represent
different trade-offs in total system throughput versus per-VM
performance. Or, even worse, in a cou- ple cases we observe that VMmark
yields opposite conclusions than TNT and ANRT, i.e., VMmark says one
system performs better than another one which is contradicted by the
TNT/ANRT performance characterization.


You can find a
[preprint](http://itkovian.net/base/files/papers/hpcvirt-2010-ageorges-preprint.pdf)
to the full paper. The presentation slides are up
[here](http://itkovian.net/base/files/papers/hpcvirt-2010-ageorges-presenatation.pdf).
