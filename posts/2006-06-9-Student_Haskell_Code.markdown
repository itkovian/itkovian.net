-----
title:  Student Haskell Code
author: Andy Georges
date: June 9, 2006
tags: 
-----







Some students refuse to grok even the basics. It saddens me that some do
not even try to load their program into a Haskell environment, such as
Hugs or GHCi. I'll not say who wrote the following code, but he/she got
very few points. None, in fact. Can you distinguish all the languages
thrown together?


78 minimal2 c endconf tempconfs bestc {


79 while ((length tempconfs) != 0)


80 do


81 -- Eindconfiguraties hebben geen verder onderzoek nodig


82 if isFinal (head tempconfs)


83 endconfs = endconfs ++ (head tempconfs)


84 tempconfs = tail tempconfs


85 -- Als een tussenconfiguratie al een hogere kost heeft dan de


86 -- goedkoopste eindconfig, moet er niks voortgerekend worden


87 else if betterCut bestc (head tempconfs)


88 tempconfs = tail tempconfs


89 -- ... en anders berekenen we de volgende configuraties


90 else


91 tempconfs = (tail tempconfs) ++ followers (head tempconfs)


92


93 -- Beste configuratie uitfilteren


94 foreach conf in tempconfs:


95 if (betterCut conf bestc)


96 then bestc = conf


97 return bestc


98 }


Of course, most code submitted was quite good.




