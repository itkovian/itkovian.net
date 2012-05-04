-----
Title:  PTLSim/KVM-QEMU on Ubuntu Karmic Koala
Author: Andy Georges
Date: September 28, 2009
----







Ubuntu Karmic Koala comes with GCC 4.4.1, and the set of include files
clashes a bit with what the KVM/QEMU port of PTLSim expects for its
string library. Mostly, the issues involve missing 'const' modifiers to
pointers. Here's a diff though.


diff --git a/Makefile b/Makefile


index a0c25f4..87d70d6 100644


--- a/Makefile


+++ b/Makefile


@@ -56,7 +56,7 @@ BUILDHOST = $(shell hostname -f)


BUILDUSER = $(USER)


CC = g++


-CFLAGS = -O99 -g3 -fpic -march=core2 -falign-functions=16
-funit-at-a-time -minline-all-stringops -fno-trapping-math
-fno-exceptions -fno-rtti -mpreferred-stack-boundary=4
-fno-strict-aliasing -Wreturn-type -mno-red-zone


+CFLAGS = -O99 -g3 -fpic -march=core2 -falign-functions=16
-funit-at-a-time -minline-all-stringops -fno-trapping-math
-fno-exceptions -fno-rtti -mpreferred-stack-boundary=4
-fno-strict-aliasing -Wreturn-type -mno-red-zone -fno-stack-protector


KVMVER = 86


QEMUDIR = ../qemu-kvm-ptlsim


INCFLAGS = -Iinclude -I. -I$(QEMUDIR)/kvm/include
-I$(QEMUDIR)/kvm/include/x86 -DPTLSIM
-D


diff --git a/lib/klibc.cpp b/lib/klibc.cpp


index ae0f75b..3b5c5c0 100644


--- a/lib/klibc.cpp


+++ b/lib/klibc.cpp


@@ -842,7 +842,7 @@ int strncmp(const char 
size











-char 


+const char 


{


for (; 


if (


@@ -858,7 +858,7 @@ char 











-char 


+const char 


{


const char 


do {


@@ -877,7 +877,7 @@ char 











-char 


+const char 


{


for (; count-- && 


if (


@@ -976,7 +976,7 @@ size











-char 


+const char 


{


const char 


@@ -1146,7 +1146,7 @@ void 











-char 


+const char 


{


int l1, l2;


@@ -1175,7 +1175,7 @@ char 











-void 


+const void 


{


const unsigned char 


while (n-- != 0) {


As you can tell, the CFLAGS definition in the Makefile was also extended
with "-fno-stack-protector", as the build with otherwise fail with a few
*undefined reference to 
lkml entry](http://lkml.org/lkml/2006/7/28/161) for more information.




