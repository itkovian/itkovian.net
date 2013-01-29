----
title: EasyBuild: Building Software With Ease
authors: Kenneth Hoste, Jens Timmerman, Andy Georges, and Stijn De Weirdt
pdf: http://itkovian.net/files/papers/preprint_easybuild_pyhpc_2012.pdf
tags: easybuild, software, installation, python
----

Maintaining a collection of software installations for a diverse user base can
be a tedious, repetitive, error-prone and time-consuming task. Because most
end-user software packages for an HPC environment are not readily available in
existing OS package managers, they require significant extra effort from the
user support team. Reducing this effort would free up a large amount of time for
tackling more urgent tasks.

In this work, we present \textit{\easybuild{}}, a software installation
framework written in Python that aims to support the various installation
procedures used by the vast collection of software packages that are typically
installed in an HPC environment -- catering to widely different user profiles.
It is built on top of existing tools, and provides support for well-established
installation procedures.  Supporting customised installation procedures requires
little effort, and sharing implementations of installation procedures becomes
very easy. Installing software packages that are supported can be done by
issuing a single command, even if dependencies are not available yet.

Hence, it simplifies the task of HPC site support teams, and even allows
end-users to keep their software installations consistent and up to date.
