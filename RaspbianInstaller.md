# Raspbian Installer

The Raspbian Installer is modeled closely after the Debian Installer and
intended to provide a custom configured Raspbian installation. Work on
the installer is just getting started and is being actively discussed in
this [Raspbian Forum
thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=6532).

Currently the installer is in a fairly primitive state and functions at
a "proof of concept" level. The notes below document the use of the
installer as it was configured on May 27th and will be useful to those
that would like to try the installer and give feedback.

Note: the SD card media that installer works with to install Raspbian
has very slow performance. Particularly with the many 10,000's of small
files the installer writes to various locations on the root file system.
Because of this slow performance, a minimal install of Raspbian can take
90 minutes or longer. An install that includes the **Debian desktop
environment** which includes 800 additional packages can take up to 8 to
9 hours to complete. Performance will vary greatly based on the speed of
the SD card installed to. Also, installation onto other media such as an
attached USB hard drive should be much better. See notes for external
drive installation [here](/RaspbianInstaller#Installing_to_USB_disk).

The files used to perform the install described below can be obtained
from this link:
[rpi\_installer\_05-27-12.zip](http://archive.raspbian.org/installer/rpi_installer_05-27-12.zip).

## Install Notes - 05/27/12

Formatted an SD card with a single FAT32 partition and copied the
installation files onto the top level directory. The partition and files
on this card will be overwritten during the installation process.

The installer is a "network" installer. This means installer requires
ethernet network connectivity to the Internet. When the installer first
starts the DHCP server on the local LAN will be queried to provide an IP
address, default route and name server required for network
connectivity.

-----

Choose a mirror of the Debian archive

Debian archive mirror country:

**\<enter information manually\>**

-----

Choose a mirror of the Debian archive

Please enter the hostname of the mirror from which Debian will be
downloaded.

**archive.raspbian.org**

**\<Continue\>**

-----

Choose a mirror of the Debian archive

Please enter the directory in which the mirror of the Debian archive is
located.

**/raspbian/**

**\<Continue\>**

-----

Choose a mirror of the Debian archive

If you need to use a HTTP proxy to access the outside world, enter the
proxy information here. Otherwise lave this blank.

HTTP proxy information (blank for none):

\[leave blank\]

**\<Continue\>**

-----

Download installer components

No kernel modules were found. This probably is due to a mismatch between
the kernel used by this version of the installer and the kernel version
available in the archive.

Continue the install without loading kernel modules?

**\<Yes\>**

-----

Set up users and passwords

Root password:

**raspbian**

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian**

-----

Set up users and passwords

A user account will be created for you to use instead of the root
account for non-administrative activities.

Full name for the new user:

**Raspbian User**

**\<Continue\>**

-----

Set up users and passwords

Username for your account:

**raspbian**

**\<Continue\>**

-----

Set up users and passwords

Choose a password for the new user:

**raspbian**

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian**

**\<Continue\>**

-----

Configure the clock

Select your time zone:

**Pacific**

-----

Partition disks

MMC/SD card \#1 (mmcblk0) - 3.9 GB SD SA04G

  - \#1 primary 78.6 MB B f fat32 /rpiboot
  - \#2 primary 3.6 GB f ext3 /
  - \#5 primary 254.8 MB f swap swap

**\<Finish partitioning and write changes to disk\>**

-----

Partition disks

The partition tables of the following devices are changed:

  - MMC/SD card \#1 (mmcblk0)

The following partitions are going to be formatted:

  - partition \#1 of MMC/SD card \#1 (mmcblk0) as fat32
  - partition \#2 of MMC/SD card \#1 (mmcblk0) as ext3
  - partition \#3 of MMC/SD card \#1 (mmcblk0) as swap

Write the changes to disks?

**\<Yes\>**

-----

Install the base system

No installable kernel was found in the defined APT sources.

Continue without installing a kernel?

**\<Yes\>**

-----

Configure the package manager

The repository on security.debian.org couldn't be accessed, so its
updates will not be made available to you at this time. You should
investigate this later.

**\<Continue\>**

-----

Configuring popularity-contest

This system may anonymously supply the distribution developers with
statistics about the most used packages on this system. This information
influences decisions such as which packages should go on the first
distribution CD.

Participate in the package usage survey?

**\<No\>**

-----

At the moment, only the core of the system is installed. To tune the
system to your needs, you can choose to install one or more of the
following predefined collections of software.

Choose software to install:

  - Debian desktop environment

  - Web server

  - Print server

  - SQL database

  - DNS server

  - File server

  - Mail server

  - **SSH server**

  - Laptop

  - **Standard system utilities**

Note: Selecting *Debian desktop environment* will install more than 800
additional packages which could take 6 hours more to setup.

-----

DECnet node configuration

**\<skip and leave config as it is\>**

-----

Continue without boot loader

No boot loader has been installed, either because you chose not to or
because your specific architecture doesn't support a boot loader yet.

**\<Continue\>**

-----

Post install:

Add the Raspbian public key for apt-get to use:

`wget http://archive.raspbian.org/raspbian.public.key -O - | apt-key add -`

-----

## Installing to USB disk

It is also possible to use the installer to install Raspbian to external
USB flash/hard drive. The external drive should be detected correctly by
installer, but in this case you will have to prepare partitions
manually. It is absolutely neccessary to keep [RasPi](/RasPi) boot
partition on SD card, it has to be the first partition there, primary,
bootable, FAT32 format. The installer will not allow you to mount this
partition as ***/boot***, though. Mount the FAT32 partition as
***/rpiboot*** instead, post-install script will rename it to /boot
after installation automatically. Any other partitions can be placed to
external drive. Remember the name of the root partition block device,
you will need to edit cmdline.txt kernel options to point rootfs to this
device after installation.
