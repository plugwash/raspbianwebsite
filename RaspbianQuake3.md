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

2.  Download the Quake 3 source code .tar.gz from here.

3.  As root, **aptitude install gcc build-essential**

4.  Also as root, **aptitude install libsdl1.2debian libsdl-image1.2
    libsdl-image1.2-dev libsdl-mixer1.2 libsdl-mixer1.2-dev
    libsdl-net1.2 libsdl-net1.2-dev** (this possibly includes
    unnecessary stuff and the occasional typo, but it worked...)

5.  Decompress your source .tar.gz and replace build.sh with the
    following:
    
    ``` 
        #!/bin/bash
        # this script builds q3 with SDL
        # invoke with ./build.sh
        # or ./build.sh clean to clean before build
    
        # directory containing the ARM shared libraries (rootfs, lib/ of SD card)
        # specifically libEGL.so and libGLESv2.so
        ARM_LIBS=/opt/vc/lib
        SDL_LIB=lib
    
        # directory containing baseq3/ containing .pk3 files - baseq3 on CD
        BASEQ3_DIR="/home/${USER}/"
    
        # directory to find khronos linux make files (with include/ containing
        # headers! Make needs them.)
        INCLUDE_DIR="/opt/vc/include"
    
        # prefix of arm cross compiler installed
        # CROSS_COMPILE=bcm2708-
    
        CROSS_COMPILE=
    
        # clean
        if [ $# -ge 1 ] && [ $1 = clean ]; then
           echo "clean build"
           rm -rf build/*
        fi
    
        # sdl not disabled
        make -j4 -f Makefile COPYDIR="$BASEQ3_DIR" ARCH=arm \
                CC=""$CROSS_COMPILE"gcc" USE_SVN=0 USE_CURL=0 USE_OPENAL=0 \
                CFLAGS="-DVCMODS_MISC -DVCMODS_OPENGLES -DVCMODS_DEPTH -DVCMODS_REPLACETRIG -I$INCLUDE_DIR" \
                LDFLAGS="-L"$ARM_LIBS" -L$SDL_LIB -lSDL -lvchostif -lvmcs_rpc_client -lvcfiled_check -lbcm_host -lkhrn_static -lvchiq_arm -lopenmaxil -lEGL -lGLESv2 -lvcos -lrt -lbcm_host -mfloat-abi=hard -mfpu=vfp"
    
        # copy the required pak3 files over
        # cp "$BASEQ3_DIR"/baseq3/*.pk3 "build/release-linux-arm/baseq3/"
    ```

6.  Do a **./build.sh**

7.  Wait.

8.  Wait a bit more. This is assuming I haven't made any mistakes in the
    guide.

9.  Find copies of the following somewhere (other guides will show you)
    and place in **build/release-linux-arm/baseq3: pak0.pk3 pak1.pk3
    pak2.pk3 pak3.pk3 pak4.pk3 pak5.pk3 pak6.pk3 pak7.pk3 pak8.pk3**

10. As root, run **ioquake3.arm**. Shoot things. (It should work as a
    non-root user when I figure out the necessary DirectFB
    incantations.)

Highly non-scientific testing (i.e. having played a normal-Debian build
a few days ago) suggests framerate is quite dramatically improved. Go
Raspbian\!
