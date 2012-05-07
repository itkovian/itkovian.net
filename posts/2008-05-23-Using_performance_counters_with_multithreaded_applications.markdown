-----
title:  Using performance counters with multi-threaded applications
author: Andy Georges
date: May 23, 2008
description: 
tags: 
-----







Since a few years, there is quite good support for using performance
counters on Linux machines. Examples are
[OProfile](http://oprofile.sourceforge.net/) (which has been included in
the kernel since 2.6, I think),
[Perfctr](http://user.it.uu.se/~mikpe/linux/perfctr/), and
[Perfmon](http://perfmon2.sourceforge.net/) (not to be confused with
[the other Perfmon](http://perfmon.sourceforge.net/), which is a SNMP
based performance monitoring tool). I think Perfmon is destined to make
it to the kernel source tree as well, or so I've heard. Yet, I have been
using Perfctr since I started my research, so this post is only about
that tool.


There has been talk on the Perfctr mailing list (which gets hopelessly
spammed these days) for including support for multi-threaded processes,
but thus far I've seen nothing that does what I want. So, without
further ado, here's how to patch your kernel to support multi-threaded
applications.


I assume you know how to install the basic Perfctr driver, and compile
your kernel to add support for it. If possible, compile it as a module,
as this is easiest if you need to change things (unless you also change
stuff in the kernel header files, in which case you probably want to
recompile the complete kernel). Let's further assume your kernel source
lives in /usr/src/linux, further referred to as toplevel. I'll also
assume we're building the Perfctr module here.


The first thing that needs to be done is make sure that child processes
set up their kernel data structures such that performance counter data
can be stored at context switch (you want to use virtual counters, i.e.,
per-process counters). Therefore you need to add a function that does
exactly this. We'll call it 
task
up and empty vperfctr structure, by simply allocating space for it. So,
add their existance to your toplevel/include/linux/perfctr.h file (which
should be there if you patched the kernel and copied the relevant files
when installing Perfctr), which should then read:


1.  2.  
3.  extern struct vperfctr
4.  struct module 
5.  void (
6.  void (
7.  void (
8.  void (
9.  struct vperfctr
10. void (
task
11. 
12. void (
vperfctr
13. 
14. } vperfctr
15. 16. extern void 
17. 
18. 
19. 
20. 
21. 
vperfctr
22. 
(
23. 
24. 
25. 
26. 
27. 
28. 
29. 

30. 

31. 


In the same file you should add some code to the
perfctr
function. Otherwise it only contains a comment stating that nothing
should be done until inheritance is implemented and sets the vperfctr
structure to NULL. The code for that function should become the
following:


1.  2.  static inline void perfctr

3.  4.  if(current-
5.  child-
6.  if(!child-
7.  printk("PERFCTR::error activating child perfctr
8.  }
9.  else {
10. 
11. }
12. }
13. else {
14. child-
15. }
16. 17. }


The above will get a new structure set up (through

control registers etc.) to that structure (through

we need to define them, which is done in
toplevel/drivers/perfctr/virtual.c.


1.  2.  struct vperfctr
3.  return get
4.  }
5.  6.  void 
parent, struct task
7.  8.  int err;
9.  struct vperfctr
10. struct vperfctr
11. 12. if(!child

13. return;
14. }
15. 16. child
17. memcpy(&(child
&(parent
sizeof(parent
18. child
19. 20. 
21. child
parent
22. 
23. 24. err =
perfctr
25. if(err < 0) {
26. printk("perfctr::error::
27. }
28. 29. }


I think the Perfctr patch uses p-
change this accordingly.


Now, to get the counter values assembled in one central spot, I'm using
a second module that accumulates these values. Upon exit, each thread
will pass on their values to that module through a hook. The code has
protection for usage on multicore processors, through a spin


Here's the code you should add to toplevel/drivers/perfctr/virtual.c to
be able to access the accumulating module through the hook.


1.  2.  void (
long long
3.  4.  int 
int
5.  
6.  return 0;
7.  }
8.  EXPORT
9.  10. int 
f
11. 
12. return 0;
13. }
14. EXPORT
15. 16. 17. static void vperfctr
struct vperfctr 
18. 19. /
20. spin
21. perfctr-
22. spin
23. 24. /

25. /
26. vperfctr
27. if( IS
28. vperfctr
29. owner-
30. vperfctr
31. 32. if(
33. int nractrs =
perfctr
34. long long counters [nractrs+1];
35. int events[nractrs+1];
36. int i = 0;
37. for(i = 0; i < nractrs; i++) {
38. events[i] = perfctr-
39. counters[i] = perfctr-
40. }
41. events[nractrs] = -1;
42. counters[nractrs] = perfctr-
43. 
44. }
45. 46. perfctr-
47. vperfctr
48. put
49. }


The final piece then is the read
accumulated.


1.  2.  
3.  
4.  
5.  
6.  
7.  
8.  
9.  
10. 
11. 
12. 
13. 14. MODULE
15. 16. 
17. 18. 
19. struct module 
20. 
21. .name = 
22. .init = init
23. 
24. .exit = cleanup
25. 
26. 27. 28. struct counter
29. long long ctrs[9];
30. int nractrs;
31. int events[9];
32. spinlock
33. 34. 35. static struct counter
36. 37. 38. void 
long long
39. 40. int i = 0;
41. spin
42. counters.nractrs = nractrs;
43. for(i = 0; i < nractrs; ++i) {
44. counters.ctrs[i] += cntrs[i];
45. }
46. spin
47. }
48. 49. 50. static int read
file
51. printk("read
52. return 0;
53. }
54. 55. 56. static int read
57. printk("read
58. return 0;
59. }
60. 61. 62. static ssize
char
63. int i = 0;
64. int res = 0;
65. 66. res = copy
67. if(!res) {
68. /
69. for(i = 0; i <= counters.nractrs; ++i) {
70. counters.ctrs[i] = 0;
71. }
72. return 0;
73. }
74. 75. return -EFAULT;
76. }
77. 78. static ssize
char
79. return 0;
80. }
81. 82. 83. static int read
struct file 
84. 85. int i;
86. int res;
87. 88. /
89. 
90. 
91. 
92. 
93. 
94. 
95. 96. int action = cmd & 0xff0000;
97. int count = cmd & 0x0000ff;
98. 99. switch(action) {
100. case 0: /
101. spin
102. for(i = 0; i <= counters.nractrs; i++) {
103. counters.ctrs[i] = 0;
104. counters.events[i] = 0;
105. }
106. spin
107. break;
108. case 1: /
109. spin
110. {
111. char tmp [(counters.nractrs+1)
112. long long
113. 114. 
115. for(i = 0; i <= counters.nractrs; ++i) {
116. 
117. }
118. 119. if(count < (counters.nractrs+1)
long)+sizeof(int)) {
120. res = -EFAULT;
121. } else {
122. /
123. 
124. 
class="indent5"
125. res = (copy
(counters.nractrs+1)
126. }
127. }
128. spin
129. return res;
130. break;
131. }
132. return -1;
133. }
134. 135. static struct file
136. .read = read
137. .write = read
138. .ioctl = read
139. .open = read
140. .flush = read
141. };
142. 143. extern int 
(
144. extern int 
145. 146. int init
147. 148. int i = 0;
149. 150. /

151. /
152. 153. 
154. 155. for(i =0; i < 9; ++i) {
156. counters.ctrs[i] = 0LL;
157. counters.events[i] = 0;
158. }
159. 160. if(register
&read
161. printk("READ
%d
162. return -EIO;
163. }
164. else {
165. printk("READ
166. }
167. return 0;
168. }
169. 170. void cleanup
171. 
172. if(unregister
173. printk("READ
READ
174. }
175. else {
176. printk("READ
177. }
178. }
179. 180. MODULE


If you wish to read the data, you must create the device
/dev/read
does the reading for you might look like this:


1.  2.  
3.  
4.  
5.  
6.  7.  struct counter
8.  long long ctrs[9];
9.  int nractrs;
10. int events[9];
11. spinlock
12. };
13. 14. struct counter
15. 16. int main() {
17. 18. int file = open("/dev/read
19. 20. if(file < 0) {
21. perror("open");
22. exit(-1);
23. }
24. 25. if(read(file, (void
counter
26. perror("oops. read error.");
27. exit(-1);
28. }
29. else {
30. int i = 0;
31. printf("read succesfull
32. printf("counters.nractrs = %d
33. 34. for(i = 0; i < counters.nractrs; ++i) {
35. printf("counters.ctrs[%d] = %lld
36. }
37. exit(0);
38. }
39. }




