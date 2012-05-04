-----
Title:  HPCVirt 2010 workshop
Author: Andy Georges
Date: April 13, 2010
-----







The paper that got rejected at VEE -- due to not good reasons, if you
ask me -- made it in for HPCVirt, which is the EuroSys workshop for High
Performance Computing in virtualised environments. So I am currently
residing in Paris for both the workshop and the main EuroSys conference.
The former comprises only 4 talks, two of which have been fairly
disappointing so far. I am not sure how the other attendants feel, but
it is my impression that our performance metrics paper generated a lot
more interest and discussion than the other papers :-/


Except for the last paper. ‘Experiences booting 10M virtual machines’
was pretty much kick-ass. The authors tried to simulate a botnet,
reportedly due to the dangerous nature of buying the (GPL, ahem) botnet
source code and then publishing about it. So they designed their own
lightweight VM, which basically uses 20M, and which has a manager that
copies the files needed to execute an app (shared libraries and all
that) to a ramdisk upo execution, and throws it away afterwards.


From what went on between, I do not recall that much (I did take notes
:-). The ending panel discussion, was pretty interesting until it
started to die. Points raised were, amongst others, why do we need
anything besides container based virtualisation, and what about QoS.
Seems like that latter
