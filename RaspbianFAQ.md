# Raspbian FAQ

### What is Raspbian?

Raspbian is an unofficial port of [Debian Wheezy
armhf](http://wiki.debian.org/ArmHardFloatPort) with compilation
settings adjusted to produce optimized hard float code that will run on
the Raspberry Pi. The official Debian Wheezy armhf release is only meant
for ARMv7-A CPUs and higher. The Raspberry Pi, having an ARMv6 CPU,
cannot run such code and requires a full rebuild of all Debian armhf
packages.

### How much of Debian Wheezy armhf will Raspbian support?

At a minimum, the intention is for Raspbian to be at parity with Debian
Wheezy armhf. Meaning, if a particular piece of open source software or
package is available for Debian Wheezy armhf, it should be available for
Raspbian once the port building process is complete. How this will work
in practice is still unknown, but experience is showing that 95% or more
of the Debian Wheezy armhf packages are rebuilding for the Raspberry Pi
without an problems.

### Will Raspbian work with non-Raspberry Pi systems?

Yes. The packages are being compiled for the ARMv6+VFP CPU. If the
hardware supports that CPU feature set then Raspbian should function
well on that hardware. That being said, many newer hardware devices
utilize a variant of the ARMv7 CPU which may be better served by the
official Debian Wheezy armhf port.

### Are you planning to have an SD image for the Raspberry Pi?

Yes, an official Raspbian SD image will be offered at some point in the
future. However, this will only occur after the process of rebuilding
all the Debian Wheezy armhf packages is complete.

### How can I use Raspbian packages until the SD image is ready?

Until then, you can try unofficial SD images such as those being offered
by [Hexxeh](HexxehImages), or install Raspbian using traditional Debian
installation techniques involving the [debootstrap
utility](http://www.debian.org/releases/stable/i386/apds03.html.en).
Raspbian packages can also be installed in a Debian chroot environment
on a Debian armel or armhf system capable of running Raspbian ARMv6
code. This is how the Raspbian port is being bootstrapped.

### What will be on the Raspbian SD image?

At this time it is impossible to determine what exactly will be provided
on the Raspbian SD image. However, at a minimum it will include a basic
Debian Wheezy install with development tools and a GUI environment. In
most respects, the initial SD image will probably look very similar to
the [Debian Sqeeze armel SD image](http://www.raspberrypi.org/downloads)
released earlier by the Raspberry Pi foundation. Except of course, it
will be compiled for optimal execution speed on the ARMv6 CPU of the
Raspberry Pi.

### Is the Raspbian repository live? If so, where can I find it?

Yes, the Raspbian repository is live and is growing in size by a few
hundred packages a day. It can be found at the following link:

<http://archive.raspbian.org/>

If you are planning on using the repository packages with apt-get, you
will want to install the Raspbian public in your apt-get keyring using
the following command:

``` 
    wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -
```

### Do you have a list of all the packages in the Raspian repository?

The current list of packages in the Raspbian repository can be found in
the text file linked below:

<http://archive.raspbian.org/raspbian/dists/wheezy/main/binary-armhf/Packages>

### Is it just the repository? Or, you will provide any customization?

The "main" area of the Raspbian repository will be kept as close to
Debian Wheezy as possible with changes limited to those we deem
essential so that a given package functions on Raspberry Pi hardware.
This approach will appeal to fans of Debian who simply want the optimal
Debian experience on the Raspberry Pi.

It is likely other extra areas of the Raspbian repository will be
created over time which will contain Raspberry Pi specific packages that
are not part of Debian. What these extras might be will be an exercise
left to the future after the initial port of Debian Wheezy armhf to the
Raspberry Pi hardware is complete.
