# Building Quake 3 in Raspbian

Documentation below pulled from the [Raspbian
Forum](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=6473).
Please update this page if errors in the build process are discovered.

I'm about to go to work in a minute, so please enjoy some terribly
condensed instructions on how to build a superpowered Quake 3 in
Raspbian, using Hexxeh's SD card image as a base. I've probably missed
something important, but this should be a helpful start.

1.  Make sure you're up-to-date with everything (aptitude update;
    aptitude upgrade)

2.  As root: **aptitude install gcc build-essential libsdl1.2-dev**

3.  Download the Quake 3 source code:
    
    ``` 
        git clone https://github.com/raspberrypi/quake3.git
    ```

4.  Edit build.sh:
    
    ``` 
        change line 8 to this: ARM_LIBS=/opt/vc/lib
        change line 16 to this: INCLUDE_DIR="/opt/vc/include"
        and comment out line 19: #CROSS_COMPILE=bcm2708-
    ```

5.  Do a **./build.sh**

6.  Wait for compilation to finish, takes about 1 hour on
    [RasPi](/RasPi).

7.  Find copies of the following somewhere (other guides will show you)
    and place in **build/release-linux-arm/baseq3:**
    
      - **pak0.pk3, pak1.pk3, pak2.pk3, pak3.pk3, pak4.pk3, pak5.pk3,
        pak6.pk3, pak7.pk3, pak8.pk3**

8.  As root: `usermod -a -G video [your_username]`, this will allow you
    to run game as non-root. Works with other directFB/SDL based stuff,
    too.

9.  If you do not intend to keep Quake 3 source code, you may reorganize
    files as suggested by [this
    thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=63&t=6511&p=83593#p83593)
    on [RasPi](/RasPi) Forum.

10. Depending on version of Raspbian you use, you may need to copy
    Broadcom libraries from /opt/vc/lib to /lib.

11. Run **ioquake3.arm**. Shoot things.

Highly non-scientific testing (i.e. having played a normal-Debian build
a few days ago) suggests framerate is quite dramatically improved. Go
Raspbian\!
