# Raspbian Installer

The files used to perform the install described below can be obtained
from the zip file at this link:
[rpi\_installer\_08-19-12.zip](http://archive.raspbian.org/installer/rpi_installer_08-19-12.zip).

This installer is a hacked up version of the debian installer, it was
created by jerry.tk who no longer appears to be active (last forum post
in january 2013, last forum visit in april 2013). To run on recently
manufactured Pis with hynix or samsung memory it is likely you will need
to replace the kernel and bootload included with the installer with more
recent versions from the raspberry pi foundation. This installer should
currently be considered abandonware. Currently we reccomend using hifi's
[raspbian-ua-netinst](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=50310)
instead if you want to use an installer rather than a pre-installed
image.

A thread on this installer can be found on the raspberry pi foundation's
forum at [Raspbian Forum
thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=6532).
The notes below document the use of the installer as it was configured
on August 20th, 2012.

Important Note: the SD card media that installer works with to install
Raspbian has very slow performance. Particularly with the many 10,000's
of small files the installer writes to various locations on the root
file system. Because of this, a minimal install of Raspbian to an SD
card can take 90 minutes or longer. An install that includes the
**Debian desktop environment** which includes 800 additional packages
can take up to 8 to 9 hours to complete. Time to complete an install
will vary greatly based on the speed of the SD card. Also, installation
onto other media such as an attached USB hard drive should be much
faster. See notes for external drive installation
[here](/RaspbianInstaller#Installing_to_USB_disk).

## Install Notes - 08/20/12

Format an SD card with a single FAT32 (MS-DOS or Windows formatted)
partition and copy the installer files from this zip file onto the top
level directory. On a Raspberry Pi with an attached monitor and keyboard
boot with the SD card to start the installer software. The partition and
files on this card will be overwritten during the installation process.

This installer is a "network" installer. This means installer requires
ethernet network connectivity to the Internet and Raspbian packages will
be pulled down from remote servers. When the installer first starts the
DHCP server on the local LAN will be queried to provide an IP address,
default route and name server required for network connectivity.

For best results please use mirror hostname
**mirrordirector.raspbian.org**, mirror directory **/raspbian** or
select Raspbian mirror geographically closest to you. See [full Raspbian
mirror list](RaspbianMirrors).

The notes below represent a typical installation process. Your specific
responses to certain questions may vary, particularly those relating to
language, time zone, system name, etc...

-----

Select a language

Choose a language to be used for the installation process. The selected
language will also be the default language for the installed system.

**English**

-----

Select your location

The selected location will be used to set your time zone and also for
example to help select the system locale. Normally this should be the
country where you live.

**United States**

-----

Configure the keyboard

Keymap to use:

**American English**

-----

Detecting network hardware

\[no input\]

-----

Configure the network

Please enter the hostname for this system.

**pisces**

-----

Configure the network

The domain name is the part of your Internet address to the right of
your hostname.

Domain name:

**home.lan**

-----

Choose a mirror of the Debian archive

Debian archive mirror country:

**\<enter information manually\>**

-----

Choose a mirror of the Debian archive

Please enter the hostname of the mirror from which Debian will be
downloaded.

**mirrordirector.raspbian.org**

**\<Continue\>**

<span class="small">Choosing mirrordirector.raspbian.org will
automatically select a mirror of Raspbian that is appropriate for your
geographic location.</span>

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

Loading additional components

\[no input\]

-----

Set up users and passwords

Root password:

**raspbian** *\[or whatever root password you want\]*

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian** *\[or whatever root password you want\]*

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

**raspbian** *\[or whatever user password you want\]*

**\<Continue\>**

-----

Set up users and passwords

Re-enter password to verify:

**raspbian** *\[or whatever user password you want\]*

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

\[no input\]

-----

Installing the base system

*This takes a while. Be patient.*

\[no input\]

-----

Configuring apt

\[no input\]

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

The Raspberry Pi should now reboot into the fresh Raspbian install.

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
