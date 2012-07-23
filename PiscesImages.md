# Bootable Raspbian "Pisces" Image by Mike Thompson

Mike Thompson has produced a publicly available SD image of Raspbian
that is bootable on Raspberry Pi hardware. This is called the "pisces"
image as that is what Mike's Raspberry Pi system is named on his LAN.

This image is a little newer and includes a more complete installation
of Raspbian and LXDE than the more minimal Hexxeh image. This image was
created using the Debian installer so it reflects a minimal Debian
installation with the LXDE packages added for a desktop.

### Download the R3 Image

The 449 MB R3 image can be downloaded from this link
[rpi\_pisces\_r3.zip](http://archive.raspbian.org/images/rpi_pisces_r3.zip)
or
[torrent](http://archive.raspbian.org/images/rpi_pisces_r3.zip.torrent).

Once booted, log into one of the two existing accounts:

  - 

|              |              |
| ------------ | ------------ |
| **Username** | **Password** |
| root         | raspbian     |
| raspbian     | raspbian     |

  - 
  

### Image Install

To install the image file, you will need to unzip it and write it to a
suitable 4G or larger SD card using the UNIX tool
[dd](http://en.wikipedia.org/wiki/Dd_\(Unix\)). Windows users should use
[Win32DiskImager](http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml).
Do not try to drag and drop or otherwise copy over the image without
using dd or Win`  `32`  `Disk`  `Imager – it won’t work. If you’re still
not clear on what to do, the community on the Raspberry Pi Wiki has
written a [guide for
beginners](http://elinux.org/RPi_Easy_SD_Card_Setup) on how to set up
your SD card.

### Image Notes

  - Typical Linux tools and editors are included
  - GNU C and C++ compilers included
  - SSH server included, launches on boot by default
  - Xorg and LXDE included, type "startx" to launch this after logging
    in
  - Hexxeh's rpi-update is included
  - Updated to the latest Raspberry Pi firmware and kernel as of July
    10th

Some notes concerning this image:

  - Remember to reset 'root' and 'raspbian' passwords and [OpenSSH
    server host
    keys](http://www.cyberciti.biz/faq/howto-regenerate-openssh-host-keys/)
    to avoid security issues.

  - Configure your timezone:
    
      - `dpkg-reconfigure tzdata`

  - Configure locale settings:
    
      - `apt-get install locales`
        
        `dpkg-reconfigure locales`

  - Configure keyboard settings:
    
      - `apt-get install keyboard-configuration`
        
        `dpkg-reconfigure keyboard-configuration`

  - Configure Exim
    
      - `dpkg-reconfigure exim4-config`

  - Install the Midori web browser:
    
      - `apt-get install midori`

  - Configure /etc/apt/sources.list to [pick-up 'contrib' and 'non-free'
    repositories](/RaspbianFAQ#What_do_I_need_in_my_sources.list_file_to_access_the_Raspbian_repository.3F).

### Keeping Up to Date

You can use the standard Debian way to update your installation:

  - `apt-get update && apt-get dist-upgrade`

To get the newest kernel and firmware,
[rpi-update](https://github.com/Hexxeh/rpi-update) is included in this
image.

Verify the system time and date are set correctly and then run the
following command:

  - `rpi-update`

### Older R2 Image

The older 465 MB R2 image can be downloaded from this link
[rpi\_pisces\_r2.zip](http://archive.raspbian.org/images/rpi_pisces_r2.zip)
or
[torrent](http://dl.dropbox.com/u/4593149/torrent/rpi_pisces_r2.zip.torrent).

### Older R1 Image

The older 466 MB R1 image can be downloaded from this link
[rpi\_pisces\_r1.zip](http://archive.raspbian.org/images/rpi_pisces_r1.zip)
or
[torrent](http://dl.dropbox.com/u/4593149/torrent/rpi_pisces_r1.zip.torrent).

Some notes concerning this image:

  - DHCP may fail on boot and the Raspberry Pi may not have network
    connectivity.
      - To fix this, delete all lines in the file
        '/etc/udev/rules.d/70-persistent-net.rules' and reboot. DHCP
        should then be functional and your Raspberry Pi should be
        assigned an IP address from the DHCP server on your local LAN.
    
      - The problem is that ethernet address of the Raspberry Pi I
        created the image on differs from the ethernet address on your
        Raspberry Pi. The OS notices this and assigns the ethernet
        interface to device 'eth1' rather than 'eth0' which is
        configured to use DHCP in the '/etc/network/interfaces' file.
    
      - It has been reported that the fix above doesn't always work. An
        alternate fix is to
        
        edit the */etc/network/interfaces* file and change eth0 to eth1
        and reboot.
