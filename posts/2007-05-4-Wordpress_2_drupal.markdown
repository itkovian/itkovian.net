-----
title:  Wordpress 2 drupal
author: Andy Georges
date: May 4, 2007
description: 
tags: 
-----







I used to have a [wordpress](http://wordpress.org/) blog at [Ghent
University](http://ugent.be/), but since acquiring the itkovian.net
domain, I decided to move to [drupal](http://drupal.org/). However,
every tool I found to port my posts over was targetting drupal < 5.0.


A [darcs](http://darcs.org/) repository is
[available](http://itkovian.net/darcs/wordpress2drupal) for a Python
script that takes out posts from a wordpress database and injects them
into drupal. The code is licensed under the GPL-2, so feel free to
extend it.


At the moment this script will **only** transfer posts, without
comments. To transfer the wordpress categories, it requires a free
tagging vocabulary, and you need to know its ID in your drupal install
(you can find this at 'admin/content/taxonomy' and selecting list terms
for the chosen vocabulary). It also requires a minor patch to the drupal
blogapi module, to allow the wordpress post dates to be taken along. You
need a configuration file with a [wordpress] and [drupal] section,
detailing the hostname, database, login info, etc. Example configuration
files are provided.


You can get the required files by


darcs get http://itkovian.net/darcs/wordpress2drupal


If you choose to extend the code, you can email the darcs patches to
itkovian drats gmail drots com.




