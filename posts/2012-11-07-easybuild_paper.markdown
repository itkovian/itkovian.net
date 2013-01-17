-----
title: EasyBuild: Building Software With Ease.
author: Andy Georges
date: October 29, 2012
description: The EasyBuild paper got accepted into PyHPC 2012.
tags: easybuild, paper, pyhpc, workshop
-----

Over the past three years, the UGent HPC team has been developing a tool for
deploying and maintaining a set of software packages the users require for
doing their experiments on the UGent HPC clusters:
[EasyBuild](http://hpcugent.github.com/easybuild).

Note that there are various build systems already out there. Notable ones are
ports, portage, Homebrew, Buildout, Scons, Red HAt Software Collections, etc.
However, none of them fit our needs. One of the key requirements in our HPC
environment is the need for multiple compiler toolchains and library stacks
sitting next to each other, allowing to build software packages with them at the
same time. Furthermore, all installed software packages should be allowed to
have multiple versions installed next to each other, without any interference.
By version we mean the combination of the software package version and the used
compiler tollchain and assorted libraries.  Also, it must be easy to install
commercial software packages, we need to have support for (complex) build
procedures, etc. To tackle these issues, EasyBuild was conceived.

Being a university, we have a quite broad spectrum of user profiles and software
packages they require. Currently, we have installed over 250 packages that are
fully supported in (some version of) EasyBuild. Some of these are quite trivial
to install -- effectively EasyBuild does little more than a configure, make and
make install sequence, with the appropriate settings to install the software
package in the desired location. However, many software packages have a far more
involved installation procedure with a very large dependency graph. Note that
each of these dependencies in turn has to be installed with the each of the
compiler toolchains we use for building the target software package.

Six months ago we decided to open up the framework under the GPL open source
license version 2. Since then, we have received great feedback, which motivated
numerous improvements to the framework. At this point, we have arrived at a 1.0
release candidate. The goal is to release the 1.0 version at SuperComputing
(SC'12) next week.

With the planned release came the idea to write some text about the design and
the use of EasyBuild, which resulted in a paper that was accepted for
publication at the [SC'12 PyHPC
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


We have packages on Pyi:

- [Everything](http://pypi.python.org/pypi/easybuild/1.0.0-rc1)
- Individual components
    - [framework](http://pypi.python.org/pypi/easybuild-framework/1.0-rc1)
    - [easyblock](http://pypi.python.org/pypi/easybuild-easyblocks/1.0-rc1)
    - [easyconfig](http://pypi.python.org/pypi/easybuild-easyconfigs/1.0.0-rc1)

And on Github:

- [Shell](http://github.com/hpcugent/easybuild) only contains setup.py and the README
- Individual components
    - [framework](http://github.com/hpcugent/easybuild-framework)
    - [easyblocks](http://github.com/hpcugent/easybuild-easyblocks)
    - [easyconfigs](http://github.com/hpcugent/easybuild-easyconfigs)

We gladly welcome contributions to the framework, so please do fork EasyBuild on
Github. If you have software packages we do not support at this point, please
consider writing down an easyconfig (and if required, an easyblock) for them.
