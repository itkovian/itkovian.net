-----
Title:  The Xen hypervisor with Ubuntu Karmic Koala
Author: Andy Georges
Date: September 26, 2009
-----







Setting up Xen should be pretty trivial these days, however if you want
to get on the edge of development, there might be some trickery
involved, which is not documented very well. Overall, the
[PvOps](http://wiki.xensource.com/xenwiki/XenParavirtOps) wiki post on
xensource does a fine job, yet several things seemed to be missing. A
lot of the flotsam on blogs and mailings lists that can be googled is
too old to be remotely useful.


Here is a more or less detailed report on how to set up Xen op
[Ubuntu](http://ubuntu.com/) Karmic Koala (9.10) on a corei7 system
(amd64). Obviously the first thing to do is upgrade the Ubuntu
installation to the latest version, or deploy a fresh Karmic
installation.


The Linux kernel source code to use resides in a [git](http://git.org/)
repository, so git should be installed, using apt-get install git. You
should not use the plain kernel sources, as they do not contain the Xen
code for dom0, at least. Instead, use the following steps to obtain the
source code


$ sudo su -


$ cd /usr/src


$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git
linux-2.6-xen


$ cd linux-2.6-xen


$ git checkout origin/xen/master -b xen/master


$ git pull


After you checked out the kernel, you might want to copy an existing
configuration file so you can re-use the result of your hard work you
did on previous installations. You should also check the file at
include/linux/swiotlb.h and if necessary apply the following patch (it
may already be in the git tip, so check first before applying :-)


diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h


index cb1a663..f4ebffb 100644


--- a/include/linux/swiotlb.h


+++ b/include/linux/swiotlb.h


@@ -2,6 +2,7 @@








+


struct device;


struct dma


Configure the kernel, e.g., make menuconfig. Do make sure that you
switch ACPI on, because the Xen dom0 config option has a dependency on
ACPI and will not show up in the configuration menu's otherwise. In the
end you should have the following configuration options set:


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


CONFIG


Build the kernel as usual using make bzImage && make modules && make
modules
right, you should be able to use the same kernel for both dom0 and domU
VMs, dom0 being the privileged guest referred to in the above
configuration options. If you are using grub, the entry for booting in
the Xen VMM and creating the dom0 is the following, if the kernel name
extension is set to xen-3.4.1:


title Xen 3.4.2-rc2 / Ubuntu karmic (development branch), kernel 2.6.31


uuid ac5415fa-73d8-47dc-bf6e-eb6004d0484c


kernel /boot/xen-3.4.2-rc1-pre.gz dom0


module /boot/vmlinuz-2.6.31-xen-3.4.1
root=UUID=ac5415fa-73d8-47dc-bf6e-eb6004d0484c ro console=tty0
earlyprintk=vga


module /boot/initrd.img-2.6.31-xen-3.4.1


quiet


It is advisable to also make an initramfs image, as follows


$ mkinitramfs -o /boot/initrd.img-2.6.31-xen-3.4.1 2.6.31-xen-3.4.1


The next step is then to get the Xen sources. I have used the Xen
3.4-testing mercurial repository. If you do not have mercurial installed
on your machine, you might want to apt-get install mercurial. The Xen
repository resides at http://xenbits.xensource.com/xen-3.4-testing.hg:


$ hg clone http://xenbits.xensource.com/xen-3.4-testing.hg


Before you proceed, make sure that your Python installation is up to
par, if necessary apt-get install python. Since several OS releases,
neither Debian, nor Ubuntu have been using the site-packages directory
to drop Python packages. They instead use dist-packages, residing in the
/usr/lib/python2.X directory. Karmic Koala comes with Python 2.6, so you
should symlink /usr/lib/python2.6/dist-packages to
/usr/lib.python2.6/site-packages. If you do not, installing xen will
create the site-packages directory, which will obviously be missing from
your sys.path when running Python. It might also be wise, if you have an
older Xen version installed to purge the python directories. I noticed
that a reinstall with the latest Xen sources failed to overwrite a bunch
of files, rather symlinking to file under /usr/shared. I have no idea
why this was the case, but other than that, those files contained code
that pointed to obsolete file locations, resulting in the xend daemon
not working correctly.


Now, you should be all set up. Build the Xen hypervisor, the Xen tools
and if necessary the Xen stub domains:


$ make install-xen


$ make install-tools


$ make install-stubdom


If everything went well, you can now boot into your dom0 domain. After
booting the hypervisor, the Linux kernel is started from the location
you stated in /boot/grub/menu.lst on the line specifying the module for
the kernel.


The final task is setting up a domU. I have chosen to host my guest
domain(s) on LVM, so the first task is setting up the LVM itself. This
is pretty straighforward. It involves creating at least one physical
volume, a volume group, and a logical volume. The first thing to do is
assign the correct parition type. In this example I will be using 500GB
of a 1TB disk, using the first primary partition, i.e., /dev/sdd1. With
fdisk, create a new partition and assign it the type 8e (Linux LVM). The
following commands set up a 16GB logical volume. First we create a
physical volume, then we set up a volume group named vg0 with physical
extends of 8M, and finally, we set up the LV called ubuntu-vm1-disk.


$ pvcreate /dev/sdd1


$ vgcreate -s 8M vg0 /dev/sdd1


$ lvcreate -L 16G -n ubuntu-vm1-disk


The volume needs a file system, which is created using the normal mke2fs
tools.


$ mke2fs -t ext3 -m 2 -v /dev/vg0/ubuntu-vm1-disk


For the domU, we also use a Ubuntu Karmic Koala, set up by debootstrap.
Note that older Ubuntu distributions should also work, though some of
the changes that need to be made might differ. Depending on your
location, you might want to use a different mirror.


$ mkdir /mnt/ubuntu


$ mount /dev/vg0/ubuntu-vm1-disk /mnt/ubuntu


$ debootstrap --arch=amd64 karmic /mnt/ubuntu
http://ubuntu.mirror.cambrium.nl/ubuntu/


Several files need to be altered or made. etc/fstab should read


proc /proc proc defaults 0 0


/dev/xvda1 / ext3 defaults,errors=remount-ro 0 1


In etc/hosts you should put something like


127.0.0.1 localhost localhost.localdomain


127.0.0.1 problemchild


Finally, you need to fix the Ubuntu upstart process to allow connection
to hvc0, otherwise you will end up with domU stating it cannot find a
file descriptor for the console. The way to fix is is by copying
/etc/init/tty1.conf to /etc/init/hvc0.conf and change the line to read


start on stopped rc RUNLEVEL=[2345]


stop on runlevel [!2345]


respawn


exec /sbin/getty -8 38400 hvc0


The newly created ubuntu installation can now be unmounted, and the domU
guest can be set up. This is an example of the domU config for the
ProblemChild domU domain, saved to /etc/xen/problem


kernel = "/boot/vmlinuz-2.6.31-xen-3.4.1"


ramdisk = "/boot/initrd.img-2.6.31-xen-3.4.1"


memory = 1024


maxmem = 1024


name = "ProblemChild"


disk = [ 'phy:vg0/ubuntu-vm1-disk,xvda1,w' ]





ip = "192.168.0.101"


netmask = "255.255.255.0"


gateway = "192.168.0.1"


hostname = "problemchild"


root = "/dev/xvda1 ro"


You should now be able to start the domain by executing


$ xm create problem


The result should be something like this at the end of the domU boot
process:











Ubuntu karmic (development branch) assail hvc0


problemchild login:




