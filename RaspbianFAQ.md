# Raspbian FAQ

Contents

1.  [Raspbian FAQ](#Raspbian_FAQ)
    1.  [I'm new to Raspberry Pi and Raspbian. What should I
        know?](#I.27m_new_to_Raspberry_Pi_and_Raspbian.__What_should_I_know.3F)
    2.  [What is Raspbian?](#What_is_Raspbian.3F)
    3.  [What is Debian?](#What_is_Debian.3F)
    4.  [Is there documentation available for
        Raspbian?](#Is_there_documentation_available_for_Raspbian.3F)
    5.  [How much of Debian Wheezy armhf will Raspbian
        support?](#How_much_of_Debian_Wheezy_armhf_will_Raspbian_support.3F)
    6.  [How fast will Raspbian be?](#How_fast_will_Raspbian_be.3F)
    7.  [Will Raspbian work with non-Raspberry Pi
        systems?](#Will_Raspbian_work_with_non-Raspberry_Pi_systems.3F)
    8.  [Are you planning to have an SD image for the Raspberry
        Pi?](#Are_you_planning_to_have_an_SD_image_for_the_Raspberry_Pi.3F)
    9.  [How can I use Raspbian packages until the SD image is
        ready?](#How_can_I_use_Raspbian_packages_until_the_SD_image_is_ready.3F)
    10. [What will be on the Raspbian SD
        image?](#What_will_be_on_the_Raspbian_SD_image.3F)
    11. [Is the Raspbian repository live? If so, where can I find
        it?](#Is_the_Raspbian_repository_live.3F__If_so.2C_where_can_I_find_it.3F)
    12. [Do you have a list of all the packages in the Raspian
        repository?](#Do_you_have_a_list_of_all_the_packages_in_the_Raspian_repository.3F)
    13. [What do I need in my sources.list file to access the Raspbian
        repository?](#What_do_I_need_in_my_sources.list_file_to_access_the_Raspbian_repository.3F)
    14. [Can I mix packages from the Debian repositories with
        Raspbian?](#Can_I_mix_packages_from_the_Debian_repositories_with_Raspbian.3F)
    15. [Are there plans to include contrib and/or non-free in the
        repository?](#Are_there_plans_to_include_contrib_and.2For_non-free_in_the_repository.3F)
    16. [Is it just the repository? Or, will you provide any
        customization?](#Is_it_just_the_repository.3F__Or.2C_will_you_provide_any_customization.3F)

## I'm new to Raspberry Pi and Raspbian. What should I know?

First of all, you need to know that Raspbian is under active development
and is not suitable at this point for someone new to Linux or small ARM
based systems such as the Raspberry Pi. The intention is that Raspbian
will become the leading OS of choice for all users of the Raspberry Pi,
but this will take time and a lot of work to accomplish. While Raspbian
is useable right now, there are many rough edges that need to be
smoothed out and polished.

At this time, [Debian Squeeze as released by the Raspberry Pi
Foundation](http://www.raspberrypi.org/downloads) is best for people who
simply want a working Linux Distribution and explore the capabilities of
the Raspberry Pi. Raspbian, on the other hand, is really for those who
either have immediate need for optimized, floating point operations on
the Raspberry Pi or are willing brave Raspbian's rough edges and help
move it forward to a more polished state.

## What is Raspbian?

Raspbian is an unofficial port of Debian Wheezy armhf with compilation
settings adjusted to produce optimized "hard float" code that will run
on the Raspberry Pi. This should provide significantly faster
performance for applications that make heavy use of floating point
arithmetic operations.

The port is necessary because the official Debian Wheezy armhf release
is compatible only with versions of the ARM architecture later than the
one used on the Raspberry Pi (ARMv7-A CPUs and higher, vs the Raspberry
Pi's ARMv6).

The official [Debian Squeeze
image](http://www.raspberrypi.org/downloads) issued by the Raspberry Pi
foundation uses "soft float" settings. The foundation found it necessary
to use the existing Debian port for less capable ARM devices due to time
and resource constraints during development of the Raspberry Pi.
Therefore, it does not use of the Pi's processor's floating point
hardware - reducing the Pi's performance during floating point intensive
applications.

## What is Debian?

Debian is a free operating system for your computer and includes the
basic set of programs and utilities that make your computer run. Debian
has a reputation within the Linux community for being very high-quality,
stable and scalable. Debian also has an extensive and friendly user
community that can help new users with support for practically any
problem. This makes Debian an ideal operating system for the Raspberry
Pi that will be used by children and many others using Linux for the
first time.

Further information about what Debian is can be found
[here](http://en.wikipedia.org/wiki/Debian),
[here](http://www.debian.org/intro/about), and
[here](http://d-i.alioth.debian.org/manual/en.i386/ch01s03.html).

## Is there documentation available for Raspbian?

Because Raspbian is Debian, there is an enormous amount of documentation
available for Raspbian. Aside from the
[Debian.org](http://www.debian.org) web site and the wealth of
information there, a terrific source of documentation is the recently
released [The Debian Administrator's
Handbook](http://debian-handbook.info/) which is available in hard-copy
or as a free download.

Any slight differences between Debian and Raspbian or aspects of
Raspbian that are unique to the Raspberry Pi hardware will be documented
on this web site.

## How much of Debian Wheezy armhf will Raspbian support?

At a minimum, the intention is for Raspbian to be at parity with Debian
Wheezy armhf. Meaning, if a particular piece of open source software or
package is available for Debian Wheezy armhf, it should be available for
Raspbian once the port building process is complete. How this will work
in practice is still unknown, but experience is showing that 95% or more
of the Debian Wheezy armhf packages are rebuilding for the Raspberry Pi
without an problems.

## How fast will Raspbian be?

As the developers of Raspbian don't yet have hardware, this is a hard
question to answer at this moment. At a minimum Raspbian will run at
least as well as any of the other currently available Linux
distributions for the Raspberry Pi.

Where Raspbian will shine compared to other Linux distributions is with
regards to hardware floating point operations and having the vast Debian
repository of applications built for optimal performance on the Rasberry
Pi hardware. We hope these two significant factors will make Raspbian
the leading Operating System choice of for users of the Raspberry Pi.

## Will Raspbian work with non-Raspberry Pi systems?

Yes. The packages are being compiled for the ARMv6+VFP CPU. If the
hardware supports that CPU feature set then Raspbian should function
well on that hardware. That being said, many newer hardware devices
utilize a variant of the ARMv7 CPU which may be better served by the
official Debian Wheezy armhf port.

## Are you planning to have an SD image for the Raspberry Pi?

Yes, an official Raspbian SD image will be offered at some point in the
future. However, this will only occur after the process of rebuilding
all the Debian Wheezy armhf packages is complete.

## How can I use Raspbian packages until the SD image is ready?

Until then, you can try unofficial SD images such as those being offered
by [Hexxeh](HexxehImages), or install Raspbian using traditional Debian
installation techniques involving the [debootstrap
utility](http://www.debian.org/releases/stable/i386/apds03.html.en).
Raspbian packages can also be installed in a Debian chroot environment
on a Debian armel or armhf system capable of running Raspbian ARMv6
code. This is how the Raspbian port is being bootstrapped.

## What will be on the Raspbian SD image?

At this time it is impossible to determine what exactly will be provided
on the Raspbian SD image. However, at a minimum it will include a basic
Debian Wheezy install with development tools and a GUI environment. In
most respects, the initial SD image will probably look very similar to
the [Debian Sqeeze armel SD image](http://www.raspberrypi.org/downloads)
released earlier by the Raspberry Pi foundation. Except of course, it
will be compiled for optimal execution speed on the ARMv6 CPU of the
Raspberry Pi.

## Is the Raspbian repository live? If so, where can I find it?

Yes, the Raspbian repository is live and is growing in size by a few
hundred packages a day. It can be found at the following link:

<http://archive.raspbian.org/>

## Do you have a list of all the packages in the Raspian repository?

The current list of packages in the Raspbian repository can be found in
the text file linked below:

<http://archive.raspbian.org/raspbian/dists/wheezy/main/binary-armhf/Packages>

## What do I need in my sources.list file to access the Raspbian repository?

Your **/etc/apt/sources.list** file should look as follows:

    deb http://archive.raspbian.org/raspbian wheezy main
    deb-src http://archive.raspbian.org/raspbian wheezy main

When using apt-get, you will will want to install the Raspbian public
key in your apt-get keyring. This can be done with following command:

    wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -

Mirrors of Raspbian that may be more suitable for users in different
geographic locations can be found [here](RaspbianMirrors).

## Can I mix packages from the Debian repositories with Raspbian?

Absolutely not. If you attempt to run Debian armel or Debian armhf
packages under Raspbian you will almost certainly end up with an
unstable system, if it runs at all. The Debian armel repositories
contain packages that utilize the soft float ABI which is incompatible
with Raspbian which utilizes the hard float ABI. The Debian armhf
repositories contain packages built for ARMv7 devices or higher and
these packages will not function on the Raspberry Pi which is an ARMv6
device.

## Are there plans to include contrib and/or non-free in the repository?

At this time we are just concentrating on 'main' packages as that is the
core of the system, but it's very likely we'll include much of 'contrib'
and 'non-free' once the initial rebuild of main is complete. What's
uncertain is how much effort would be put into fixing 'contrib' and
'non-free' packages that might have build problems.

## Is it just the repository? Or, will you provide any customization?

In general, the Raspbian repository will be kept as close to Debian
Wheezy as possible with changes limited to those we deem essential so
that a given package functions on Raspberry Pi hardware. This approach
will appeal to fans of Debian who simply want the optimal Debian
experience on Raspberry Pi hardware.

It is likely other extra areas of the Raspbian repository will be
created over time which will contain Raspberry Pi specific packages that
are not part of Debian. What these extras might be will be an exercise
left to the future after the initial port of Debian Wheezy armhf to the
Raspberry Pi hardware is complete.
