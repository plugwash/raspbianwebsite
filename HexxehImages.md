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

  - Icons for LXDE are missing so run:
      - `apt-get install lxde-icon-theme`
  - rpi-update will only work after time has been set so run:
      - `apt-get install ntpdate`
  - after ntpdate has been installed run:
      - `ntpdate uk.pool.ntp.org`

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
