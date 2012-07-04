# Bootable Raspbian Images by Hexxeh

[Hexxeh](http://hexxeh.net/) has produced a publicly available SD image
of Raspbian that is bootable on Raspberry Pi hardware.

Because Raspbian packages are still being built, this image provides
only minimal install of Raspbian that will boot to a command prompt.
However, it is an excellent tool to use for testing hard float
compilations, running benchmarks and debugging packages that are having
problems building on the Raspbian autobuilders.

### Download the Image

The 222 MB image can be downloaded from this link
[raspbian-r3.zip](http://distribution.hexxeh.net/raspbian/raspbian-r3.zip)
or by
[torrent](http://dl.dropbox.com/u/4593149/raspbian-r3.zip.torrent).

Once booted, log into the 'root' account with the password 'hexxeh'.

Changes from the previous r2 image are as follows:

  - SSH server included, launches on boot by default
  - LXDE and Xorg server now included, type "startx" to launch this
    after logging in
  - Changed the sources.list to point to the new raspbian.org address
  - rpi-update is included (as is Git, since rpi-update requires this)
  - Updated to the latest Raspberry Pi firmware and kernel as of 13th
    May

Some notes concerning this image:

  - Before starting to install stuff update the package lists in apt
    (otherwise you are likely to get a load of file not found errors)
      - `apt-get update`
  - Icons for LXDE are missing, so run:
      - `apt-get install lxde-icon-theme`
  - Time is not set, so run:
      - `apt-get install ntp fake-hwclock`
  - Choose your timezone:
      - `dpkg-reconfigure tzdata`
  - Configure locale settings:
      - `apt-get install locales`
        
        `dpkg-reconfigure locales`
  - Configure keyboard settings:
      - `apt-get install console-setup keyboard-configuration`
        
        `dpkg-reconfigure keyboard-configuration`
  - The image is quite minimal. If you want a load of old-fassioned unix
    style cruft installed issue the following commands as root. This
    will install about 100 additional "standard" Linux packages.
      - `apt-get install tasksel`
        
        `tasksel install standard`

**WARNING: Tasksel can kill SSH**

It has been reported that the above "tasksel" command can kill the ssh
server deamon on this image. This can be a big problem for people who
are running their Raspberry Pi headless and can't plug in a monitor and
keyboard to fix the issue by reinstalling the openssh-server package.
Until this problem is understood and resolved, it would be best to avoid
using "tasksel" on a headless Raspberry Pi running this image and use
"apt-get" to install the required packages.

  - Some problems have been reported when using tasksel not being able
    to install packages. If you encounter errors, add the following line
    to the file */etc/sysctl.conf*, reboot and try running tasksel
    again:
    
      - `vm.min_free_kbytes = 8192`
    
    This tells the kernel to try and keep 8MB of RAM free at all times.
    It's useful on swap-less machines, where you don’t want incoming
    network traffic to overwhelm the kernel and force an OOM before it
    has time to flush any buffers.

### Using the Image

To use an image file, you will need to unzip it and write it to a
suitable SD card using the UNIX tool
[dd](http://en.wikipedia.org/wiki/Dd_\(Unix\)). Windows users should use
[Win32DiskImager](http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml).
Do not try to drag and drop or otherwise copy over the image without
using dd or Win`  `32`  `Disk`  `Imager – it won’t work. If you’re still
not clear on what to do, the community on the Raspberry Pi Wiki has
written a [guide for
beginners](http://elinux.org/RPi_Easy_SD_Card_Setup) on how to set up
your SD card.

### Keeping Up to Date

You can use the standard Debian way to update your installation:

  - `apt-get update && apt-get dist-upgrade`

To get the newest kernel and firmware,
[rpi-update](https://github.com/Hexxeh/rpi-update) is included in this
image.

Just run the following command:

  - `rpi-update`

rpi-update will only work after time has been set. Install ntp as
described above or set the time with ntpdate:

  - `apt-get install ntpdate`
    
    `ntpdate uk.pool.ntp.org`
