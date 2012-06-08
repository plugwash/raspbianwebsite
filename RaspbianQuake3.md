# Building Quake 3 in Raspbian

Documentation below pulled from the [Raspbian
Forum](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=6473).
Please update this page if errors in the build process are discovered.

1.  Make sure you're up-to-date with everything (aptitude update;
    aptitude upgrade)

2.  As root:
    
    ``` 
        aptitude install git gcc build-essential libsdl1.2-dev
    ```

3.  Download the Quake 3 source code:
    
    ``` 
        git clone https://github.com/raspberrypi/quake3.git
    ```

4.  Edit *build.sh* in *quake3* directory:
    
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

8.  As root: `usermod -a -G video [your_username]`, log out, log back
    in. This will allow you to run game as non-root. Works with other
    directFB/SDL based stuff, too.

9.  If you do not intend to keep Quake 3 source code, you may reorganize
    files as suggested by [this
    thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=63&t=6511&p=83593#p83593)
    on [RasPi](/RasPi) Forum.

10. As root: `rpi-update 192`, reboot.

11. Run **ioquake3.arm**. Shoot things.

Highly non-scientific testing (i.e. having played a normal-Debian build
a few days ago) suggests framerate is quite dramatically improved. Go
Raspbian\!

## Troubleshooting

  - Compiling fails, complaining about missing `vcos_platform_types.h`
    file. See this issue in [RasPi](/RasPi) repository:
    <https://github.com/raspberrypi/firmware/issues/34>

  - Game cannot find Broadcom libraries. As root do:
    
        cd /etc/ld.so.conf.d/
        echo /opt/vc/lib >broadcomlib.conf
        ldconfig

  - If you get an error like "**failed to open vchiq instance**" you'll
    need to:
    
    ``` 
        chmod a+rw /dev/vchiq
    ```

  - If running as a non-root user and running from the console (non
    X11), then quake3 may bomb out with an error message like
    **'SDL\_Init()**' **'Unable to open mouse**'. You'll need to fix
    permissions so that non-root user can access /dev/input/mice and
    /dev/input/mouse0.
    
      - Create new file `/etc/udev/rules.d/99-input.rules`:
    
    <!-- end list -->
    
    ``` 
        # file /etc/udev/rules.d/99-input.rules
        KERNEL=="mice", NAME="input/%k", MODE="664", GROUP="input"
        KERNEL=="mouse*", NAME="input/%k", MODE="664", GROUP="input"
    ```
    
      - Add a new group and add your user(s) to it:
    
    <!-- end list -->
    
        groupadd input
        usermod -a -G input [your_username]
    
      - Log out, log back in.
