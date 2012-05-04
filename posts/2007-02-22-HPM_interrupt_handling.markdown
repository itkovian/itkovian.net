-----
title:  HPM interrupt handling
author: Andy Georges
date: February 22, 2007
tags: 
-----







Getting exact process information is tough, especially when the tool one
uses is not behaving as one expects. To ease the matter somewhat, I drew
a graph that show exactly how
[perfctr](http://user.it.uu.se/~mikpe/linux/perfctr/) calls the
interrupt handler and sets the offending process' signal.


[![image](4C0379C3-4E09-4E79-9D99-EB05366DDAE7-1.jpg)](http://www.flickr.com/photos/itkovian/397643171/)


The idea is to assemble *correct* information on the event counts per
fixed intruction count interval of e.g., 100M instructions. However, due
to the non-deterministic nature of a multitasking kernel, sometimes we
see IPC values that are ... unexpected. Hopefully this graph sets us on
the right track once more. In normal circumstances, having a few counts
off track, is not too bad, but for the work we're currently doing, we
require correct counts.




