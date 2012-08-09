# Raspbian Installer

The Raspbian Installer is modeled closely after the Debian Installer and
intended to provide a custom configured Raspbian installation. Work on
the installer is just getting started and is being actively discussed in
this [Raspbian Forum
thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=6532).

Currently the installer is in a fairly primitive state and functions at
a "proof of concept" level. The notes below document the use of the
installer as it was configured on June 18th and will be useful to those
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
[rpi\_installer\_06-18-12.zip](http://archive.raspbian.org/installer/rpi_installer_06-18-12.zip).

Please remember to perform *rpi-update* after the installation to
install Raspberry Pi specific libraries and firmware.

### Preinstalled SD Cards

Looking for a simple way to get your Raspberry Pi up and running?
[TrendingUK](http://www.trendinguk.co.uk/) offer Sandisk SD SDHC cards
with the latest official Raspbian image preinstalled, ready to be
plugged into your Raspberry Pi. Available in
[4GB](http://www.trendinguk.co.uk/4gb-sandisk-sdhc-card-with-raspbian-wheezy-linux-preinstalled.html/),
[8GB](http://www.trendinguk.co.uk/8gb-sandisk-sdhc-card-with-raspbian-wheezy-linux-preinstalled.html),
[16GB](http://www.trendinguk.co.uk/16gb-sandisk-sdhc-card-with-raspbian-wheezy-linux-preinstalled.html)
or
[32GB](http://www.trendinguk.co.uk/32gb-sandisk-sdhc-card-with-raspbian-wheezy-linux-preinstalled.html)
capacities.

## Install Notes - 06/18/12

Formatted an SD card with a single FAT32 partition and copied the
installation files onto the top level directory. The partition and files
on this card will be overwritten during the installation process.

The installer is a "network" installer. This means installer requires
ethernet network connectivity to the Internet. When the installer first
starts the DHCP server on the local LAN will be queried to provide an IP
address, default route and name server required for network
connectivity. For best results please use mirror hostname
**mirrordirector.raspbian.org**, mirror directory **/raspbian** or
select Raspbian mirror geographically closest to you. See [full Raspbian
mirror list](RaspbianMirrors).

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

<span class="small">The modules being complained about here are less
used filesystems, crypto, etc. Currently some of this stuff is compiled
straight into the installer kernel and some modules are really missing.
It shouldn't give you much problems though, only maybe if you choose to
install to encrypted partition - that will probably fail.</span>

<span class="small">Currently there is no standard Raspberry Pi kernel
installer package. This issue is worked around by including the current
kernel.img into installer initramfs and copying it to the Raspberry Pi
boot partition directly after the installer is done. This way your
Raspberry Pi will boot after installation.</span>

-----

Set up users and passwords

Root password:

**raspbian** *\[or whatever password you want\]*

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian** *\[or whatever password you want\]*

-----

Set up users and passwords

A user account will be created for you to use instead of the root
account for non-administrative activities.

Full name for the new user:

**Raspbian User** *\[or whatever full name you want\]*

**\<Continue\>**

-----

Set up users and passwords

Username for your account:

**raspbian** *\[or whatever username you want\]*

**\<Continue\>**

-----

Set up users and passwords

Choose a password for the new user:

**raspbian** *\[or whatever password you want\]*

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian** *\[or whatever password you want\]*

**\<Continue\>**

-----

Configure the clock

Select your time zone:

**\<Pacific\>**

-----

Partition disks

MMC/SD card \#1 (mmcblk0) - 3.9 GB SD SA04G

  - \#1 primary 78.6 MB B f fat32 /rpiboot
  - \#2 primary 255.9 MB f swap swap
  - \#3 primary 3.6 GB f ext3 /

*Note: the details above will vary by the specifics of your SD card. If
you do not use automatic partitioning please keep in mind that
<span class="u">FAT32 boot partition has to be mounted as
/rpiboot</span>.*

**\<Finish partitioning and write changes to disk\>**

-----

Partition disks

The partition tables of the following devices are changed:

  - MMC/SD card \#1 (mmcblk0)

The following partitions are going to be formatted:

  - partition \#1 of MMC/SD card \#1 (mmcblk0) as fat32
  - partition \#2 of MMC/SD card \#1 (mmcblk0) as swap
  - partition \#3 of MMC/SD card \#1 (mmcblk0) as ext3

*Note: the details above will vary by the specifics of your SD card.*

Write the changes to disks?

**\<Yes\>**

-----

Partitions formatting

*This takes a while depending on the size of the SD card. Be patient.*

-----

Installing the base system

*This takes a while. Be patient.*

-----

Configuring apt

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

*Note: Selecting 'Debian desktop environment' will install more than 800
additional packages which could take 6 hours more to setup.*

-----

Select and install software

*This takes a while. Be patient.*

-----

Continue without boot loader

No boot loader has been installed, either because you chose not to or
because your specific architecture doesn't support a boot loader yet.

**\<Continue\>**

-----

Finishing the installation

-----

Post install:

  - Run *rpi-update* to install the latest kernel along with its modules
    and Broadcom libraries.

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

-----

## Troubleshooting

If anything goes wrong during installation, there are several ways to
learn what is the problem. You can switch to another console by pressing
Alt+F2 or Alt+F3. Current installation log is available at Alt+F4.
Anytime installer waits for user input or keypress, you can also press
Shift+F5. This will bring you to advanced installer menu.

When installer fails to install Raspbian and displays an error message,
it is possible to save installation log for later examination. Go to
advanced installer menu (Shift+F5), run shell and mount FAT32 partition:
`mount -t vfat /dev/mmcblk0p1 /mnt  `Leave shell and save installer logs
to /mnt directory.

If installer finishes successfully, logs are stored to
/var/log/installer.
