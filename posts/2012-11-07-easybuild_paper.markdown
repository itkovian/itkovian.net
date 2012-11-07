-----
title: EasyBuild: Building Software With Ease.
author: Andy Georges
date: October 29, 2012
description: Our EasyBuild paper got accepted into PyHPC 2012.
tags: easybuild, paper, pyhpc, workshop
-----

Over the past three years, the UGent HPC team has been developing a tool for
deploying and maintaining a set of software packages the users require for
doing their experiments on the UGent HPC clusters:
[EasyBuild](http://github.com/hpcugent/easybuild-framework).

Note that there are various build systems already out there. Notable ones are
ports, portage, and friends. However, none of them fit our needs. We must be
able to have multiple compiler toolchains and library stacks sitting next to
each other and build software packages with them at the same time. All software
packages should be allowed to have multiple versions installed next to each
other, without any interference. It must be easy to install commercial software
packages, we need have support for (complex) build procedures, etc. Hence,
EasyBuild was conceived.

Over time, the set of packages we have installed has grown to be reasonably
large; at the time of this writing, we support little over 250 packages. Some of
these are quite trivial to build and install, others are much more involved --
several have numerous dependencies, all of these need to be build with each
compiler toolchain we support.

Recently, the tool has undergone a major overhaul, and we have been slowly
converging to a 1.0 release version. Last summer, the idea grew to write down
how EasyBuild is constructed, what its purpose is and how it manages to help
system administrators deploying software packages.

We wrote this down in a workshop paper, to be presented at the [SC'12 PyHPC
workshop](http://www.dlr.de/sc/en/desktopdefault.aspx/tabid-8028/13765_read-34936/),
titled `EasyBuild: Building Software With Ease` by Kenneth Hoste, Jens
Timmerman, Andy Georges, and Stijn De Weirdt.

You can obtain a [preprint
version](http://itkovian.net/files/papers/preprint_easybuild_pyhpc_2012.pdf).

The abstract of the paper reads as follows.

_Maintaining a collection of software installations for a diverse user base
can be a tedious, repetitive, error-prone and time-consuming task. Because most
end-user software packages for an HPC environment are not readily available in
existing OS package managers, they require significant extra effort
from the user support team. Reducing this effort would free up a
large amount of time for tackling more urgent tasks.

In this work, we present \textit{\easybuild{}}, a software installation framework
written in Python that aims to support the various installation procedures used
by the vast collection of software packages that are typically installed in an
HPC environment -- catering to widely different user profiles. It is built on top
of existing tools, and provides support for well-established installation procedures.
Supporting customised installation procedures requires little effort, and sharing
implementations of installation procedures becomes very easy. Installing
software packages that are supported can be done by issuing a single command, even
if dependencies are not available yet.

Hence, it simplifies the task of HPC site support teams, and even allows end-users
to keep their software installations consistent and up to date._

The presentation by [Kenneth Hoste](http://boegel.kejo.be/) will be linked soon
:-)

We gladly welcome contributions to the framework, so please do fork EasyBuild on
Github. If you have software packages we do not support at this point, please
consider writing down an easyconfig (and if required, an easyblock) for them.
