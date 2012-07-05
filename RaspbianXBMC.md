# Building XBMC

The following instructions were derived from instructions passed to me
from Obsy on the \#raspbian IRC channel. These instructions document the
steps necessary to build [XBMC](http://xmbc.org) in Raspbian. These
steps are not optimal and need to be refined, but they do result in a
working build of XBMC that seems to work well within Raspian.

### Build and Install XBMC

1.  Start with a [Pisces](PiscesImages) or similar image of Raspbian.
    
      - Build and installation is done under the 'raspbian' user
        account.
      - Sudo is used as needed to perform certain operations as root.

2.  Make sure we have maximum memory for building.
    
    ``` 
        sudo cp /boot/arm224_start.elf /boot/start.elf
    ```

3.  Update kernel & firmware and reboot
    
    ``` 
        sudo rpi-update
        sudo reboot
    ```

4.  Install/upgrade build tools and dependencies.
    
    ``` 
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install build-essential autoconf ccache gawk gperf mesa-utils
        sudo apt-get install autotools-dev comerr-dev dpkg-dev libalsaplayer-dev \
        libapt-pkg-dev:armhf libasound2-dev:armhf libass-dev:armhf libatk1.0-dev \
        libavahi-client-dev libavahi-common-dev libavcodec-dev libavformat-dev \
        libavutil-dev libbison-dev:armhf libbluray-dev:armhf libboost1.49-dev \
        libbz2-dev:armhf libc-dev-bin libc6-dev:armhf libcaca-dev libcairo2-dev \
        libcdio-dev libclalsadrv-dev libcrypto++-dev libcups2-dev libcurl3-gnutls-dev \
        libdbus-1-dev libdbus-glib-1-dev libdirectfb-dev libdrm-dev libegl1-mesa-dev \
        libelf-dev libenca-dev libept-dev libevent-dev libexpat1-dev libflac-dev:armhf \
        libfontconfig1-dev libfreetype6-dev libfribidi-dev libgconf2-dev \
        libgcrypt11-dev libgdk-pixbuf2.0-dev libgl1-mesa-dev libgles2-mesa-dev \
        libglew-dev:armhf libglewmx-dev:armhf libglib2.0-dev libglu1-mesa-dev \
        libgnome-keyring-dev libgnutls-dev libgpg-error-dev libgtk2.0-dev libhal-dev \
        libhunspell-dev:armhf libice-dev:armhf libicu-dev libidn11-dev libiso9660-dev \
        libjasper-dev libjbig-dev:armhf libjconv-dev libjpeg8-dev:armhf libkrb5-dev \
        libldap2-dev:armhf libltdl-dev:armhf liblzo2-dev libmad0-dev libmicrohttpd-dev \
        libmodplug-dev libmp3lame-dev:armhf libmpeg2-4-dev libmysqlclient-dev \
        libncurses5-dev libnspr4-dev libnss3-dev libogg-dev:armhf libopenal-dev:armhf \
        libp11-kit-dev libpam0g-dev:armhf libpango1.0-dev libpcre++-dev libpcre3-dev \
        libpixman-1-dev libpng12-dev libprotobuf-dev libpthread-stubs0-dev:armhf \
        libpulse-dev:armhf librtmp-dev libsamplerate0-dev:armhf \
        libsdl-image1.2-dev:armhf libsdl1.2-dev libslang2-dev:armhf \
        libsm-dev:armhf libsmbclient-dev:armhf libspeex-dev:armhf \
        libsqlite3-dev libssh-dev libssh2-1-dev libssl-dev libstdc++6-4.6-dev \
        libtagcoll2-dev libtasn1-3-dev libtiff4-dev libtinfo-dev:armhf libtinyxml-dev \
        libts-dev:armhf libudev-dev libv8-dev libva-dev:armhf libvdpau-dev:armhf \
        libvorbis-dev:armhf libvpx-dev:armhf libwebp-dev:armhf libwibble-dev \
        libx11-dev:armhf libx11-xcb-dev libxapian-dev libxau-dev:armhf \
        libxcb-glx0-dev:armhf libxcb-render0-dev:armhf libxcb-shm0-dev:armhf \
        libxcb1-dev:armhf libxcomposite-dev libxcursor-dev:armhf libxdamage-dev \
        libxdmcp-dev:armhf libxext-dev:armhf libxfixes-dev libxft-dev libxi-dev \
        libxinerama-dev:armhf libxml2-dev:armhf libxmu-dev:armhf libxrandr-dev \
        libxrender-dev:armhf libxslt1-dev libxss-dev:armhf libxt-dev:armhf \
        libxtst-dev:armhf libxxf86vm-dev libyajl-dev libzip-dev linux-libc-dev:armhf \
        lzma-dev mesa-common-dev python-dev python2.7-dev x11proto-composite-dev \
        x11proto-core-dev x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev \
        x11proto-gl-dev x11proto-input-dev x11proto-kb-dev x11proto-randr-dev \
        x11proto-record-dev x11proto-render-dev x11proto-scrnsaver-dev \
        x11proto-xext-dev x11proto-xf86vidmode-dev x11proto-xinerama-dev xtrans-dev \
        zlib1g-dev:armhf
        sudo apt-get clean
    ```

5.  Copy /opt/vc/include to /usr/include.
    
    ``` 
        sudo cp -R /opt/vc/include/* /usr/include
        sudo cp /opt/vc/include/interface/vcos/pthreads/* /usr/include/interface/vcos
    ```

6.  Create symbolic links for libEGL and libGLESv2 from /opt/vc/lib to
    /usr/lib and /usr/lib/arm-linux-gnueabihf
    
    ``` 
        sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/libEGL.so
        sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so
        sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1
        sudo ln -fs /opt/vc/lib/libEGL_static.a /usr/lib/libEGL_static.a
        sudo ln -fs /opt/vc/lib/libEGL_static.a /usr/lib/arm-linux-gnueabihf/libEGL_static.a
        sudo ln -fs /opt/vc/lib/libGLESv2.so /usr/lib/libGLESv2.so
        sudo ln -fs /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so
        sudo ln -fs /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2
        sudo ln -fs /opt/vc/lib/libGLESv2_static.a /usr/lib/libGLESv2_static.a
        sudo ln -fs /opt/vc/lib/libGLESv2_static.a /usr/lib/arm-linux-gnueabihf/libGLESv2_static.a
        sudo ln -fs /opt/vc/lib/libbcm_host.so /usr/lib/libbcm_host.so
        sudo ln -fs /opt/vc/lib/libbcm_host.so /usr/lib/arm-linux-gnueabihf/libbcm_host.so
        sudo ln -fs /opt/vc/lib/libvchiq_arm.a /usr/lib/libvchiq_arm.a
        sudo ln -fs /opt/vc/lib/libvchiq_arm.a /usr/lib/arm-linux-gnueabihf/libvchiq_arm.a
        sudo ln -fs /opt/vc/lib/libvchiq_arm.so /usr/lib/libvchiq_arm.so
        sudo ln -fs /opt/vc/lib/libvchiq_arm.so /usr/lib/arm-linux-gnueabihf/libvchiq_arm.so
        sudo ln -fs /opt/vc/lib/libvcos.a /usr/lib/libvcos.a
        sudo ln -fs /opt/vc/lib/libvcos.a /usr/lib/arm-linux-gnueabihf/libvcos.a
        sudo ln -fs /opt/vc/lib/libvcos.so /usr/lib/libvcos.so
        sudo ln -fs /opt/vc/lib/libvcos.so /usr/lib/arm-linux-gnueabihf/libvcos.so
    ```

7.  Get the latest XBMC from git.
    
    ``` 
        git clone --depth 1 git://github.com/xbmc/xbmc-rbp.git
    ```

8.  Prepare the XBMC code for compilation.
    
    ``` 
        cd xbmc-rbp/
        sed -i 's/USE_BUILDROOT=1/USE_BUILDROOT=0/' tools/rbp/setup-sdk.sh
        sed -i 's/TOOLCHAIN=\/usr\/local\/bcm-gcc/TOOLCHAIN=\/usr/' tools/rbp/setup-sdk.sh
        sudo sh tools/rbp/setup-sdk.sh
        sed -i 's/cd $(SOURCE); $(CONFIGURE)/#cd $(SOURCE); $(CONFIGURE)/' tools/rbp/depends/xbmc/Makefile
    ```

9.  Build the XMBC build tools.
    
    ``` 
        make -C tools/rbp/depends/xbmc/
    ```

10. Configure XBMC.
    
    ``` 
        ./configure --prefix=/usr --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf \
        --localstatedir=/var/lib --with-platform=raspberry-pi --disable-gl --enable-gles \
        --disable-x11 --disable-sdl --enable-ccache --enable-optimizations \
        --enable-external-libraries --disable-goom --disable-hal --disable-pulse \
        --disable-vaapi --disable-vdpau --disable-xrandr --disable-airplay \
        --disable-alsa --enable-avahi --disable-libbluray --disable-dvdcss \
        --disable-debug --disable-joystick --enable-mid --disable-nfs --disable-profiling \
        --disable-projectm --enable-rsxs --enable-rtmp --disable-vaapi \
        --disable-vdadecoder --disable-external-ffmpeg  --disable-optical-drive
    ```

11. Fix up some of the make files.
    
    ``` 
        sed -i 's/-msse2//' lib/libsquish/Makefile
        sed -i 's/-DSQUISH_USE_SSE=2//' lib/libsquish/Makefile
    ```

12. Make XBMC.
    
    ``` 
        make
    ```

13. Install XBMC as root.
    
    ``` 
        sudo make install
    ```

### Prepare to Run XBMC

1.  Comment out the swap line in */etc/fstab* by prepending a '\#'
    character.
    
    ``` 
        #/dev/mmcblk0p2  none            swap    sw              0       0
    ```

2.  Remove non-essential services not needed by XBMC. Others can be
    removed as well.
    
    ``` 
        sudo apt-get purge exim4 exim4-base exim4-config exim4-daemon-light
    ```

3.  Run XBMC using the GPU 128MB memory scheme.
    
    ``` 
        sudo cp /boot/arm128_start.elf /boot/start.elf
    ```

4.  Edit the config.txt as needed. Mine just contains the following:
    
    ``` 
        disable_overscan=1
    ```
    
      - Note: Setting 24 or 32 bit frame buffer depths seems to cause
        problems such as black frames appearing from time to time in the
        playback of media. Leaving the default 16 bit depth seems to
        work best.

5.  Reboot.
    
    ``` 
        sudo reboot
    ```

6.  Login and run XBMC as root.
    
    ``` 
        clear ; sudo /usr/lib/xbmc/xbmc.bin
    ```

-----

### XBMC Configuration Output

The following is output from the XBMC configuration command. It may be
useful for comparison purposes and to see what features are enabled and
disabled.

  - ``` 
    $ ./configure --prefix=/usr --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf --localstatedir=/var/lib --with-platform=raspberry-pi --disable-gl --enable-gles --disable-x11 --disable-sdl --enable-ccache --enable-optimizations --enable-external-libraries --disable-goom --disable-hal --disable-pulse --disable-vaapi --disable-vdpau --disable-xrandr --disable-airplay --disable-alsa --enable-avahi --disable-libbluray --disable-dvdcss --disable-debug --disable-joystick --enable-mid --disable-nfs --disable-profiling --disable-projectm --enable-rsxs --enable-rtmp --disable-vaapi --disable-vdadecoder --disable-external-ffmpeg  --disable-optical-drive
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking build system type... arm-unknown-linux-gnueabihf
    checking host system type... arm-unknown-linux-gnueabihf
    checking for arm-linux-gnueabihf-g++... arm-linux-gnueabihf-g++
    checking whether the C++ compiler works... yes
    checking for C++ compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C++ compiler... yes
    checking whether arm-linux-gnueabihf-g++ accepts -g... yes
    checking for style of include used by make... GNU
    checking dependency style of arm-linux-gnueabihf-g++... none
    checking for arm-linux-gnueabihf-gcc... arm-linux-gnueabihf-gcc
    checking whether we are using the GNU C compiler... yes
    checking whether arm-linux-gnueabihf-gcc accepts -g... yes
    checking for arm-linux-gnueabihf-gcc option to accept ISO C89... none needed
    checking dependency style of arm-linux-gnueabihf-gcc... none
    checking how to print strings... printf
    checking for a sed that does not truncate output... /bin/sed
    checking for grep that handles long lines and -e... /bin/grep
    checking for egrep... /bin/grep -E
    checking for fgrep... /bin/grep -F
    checking for ld used by arm-linux-gnueabihf-gcc... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
    checking the name lister (/usr/bin/nm -B) interface... BSD nm
    checking whether ln -s works... yes
    checking the maximum length of command line arguments... 1572864
    checking whether the shell understands some XSI constructs... yes
    checking whether the shell understands "+="... yes
    checking how to convert arm-unknown-linux-gnueabihf file names to arm-unknown-linux-gnueabihf format... func_convert_file_noop
    checking how to convert arm-unknown-linux-gnueabihf file names to toolchain format... func_convert_file_noop
    checking for /usr/bin/ld option to reload object files... -r
    checking for arm-linux-gnueabihf-objdump... no
    checking for objdump... objdump
    checking how to recognize dependent libraries... pass_all
    checking for arm-linux-gnueabihf-dlltool... no
    checking for dlltool... no
    checking how to associate runtime and link libraries... printf %s\n
    checking for arm-linux-gnueabihf-ar... no
    checking for ar... ar
    checking for archiver @FILE support... @
    checking for arm-linux-gnueabihf-strip... no
    checking for strip... strip
    checking for arm-linux-gnueabihf-ranlib... no
    checking for ranlib... ranlib
    checking command to parse /usr/bin/nm -B output from arm-linux-gnueabihf-gcc object... ok
    checking for sysroot... no
    checking for arm-linux-gnueabihf-mt... no
    checking for mt... mt
    checking if mt is a manifest tool... no
    checking how to run the C preprocessor... arm-linux-gnueabihf-gcc -E
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking for dlfcn.h... yes
    checking for objdir... .libs
    checking if arm-linux-gnueabihf-gcc supports -fno-rtti -fno-exceptions... no
    checking for arm-linux-gnueabihf-gcc option to produce PIC... -fPIC -DPIC
    checking if arm-linux-gnueabihf-gcc PIC flag -fPIC -DPIC works... yes
    checking if arm-linux-gnueabihf-gcc static flag -static works... yes
    checking if arm-linux-gnueabihf-gcc supports -c -o file.o... yes
    checking if arm-linux-gnueabihf-gcc supports -c -o file.o... (cached) yes
    checking whether the arm-linux-gnueabihf-gcc linker (/usr/bin/ld) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... yes
    checking how to run the C++ preprocessor... arm-linux-gnueabihf-g++ -E
    checking for ld used by arm-linux-gnueabihf-g++... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking whether the arm-linux-gnueabihf-g++ linker (/usr/bin/ld) supports shared libraries... yes
    checking for arm-linux-gnueabihf-g++ option to produce PIC... -fPIC -DPIC
    checking if arm-linux-gnueabihf-g++ PIC flag -fPIC -DPIC works... yes
    checking if arm-linux-gnueabihf-g++ static flag -static works... yes
    checking if arm-linux-gnueabihf-g++ supports -c -o file.o... yes
    checking if arm-linux-gnueabihf-g++ supports -c -o file.o... (cached) yes
    checking whether the arm-linux-gnueabihf-g++ linker (/usr/bin/ld) supports shared libraries... yes
    checking dynamic linker characteristics... (cached) GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking for gawk... (cached) gawk
    checking whether ln -s works... yes
    checking whether make sets $(MAKE)... (cached) yes
    checking for size_t... yes
    checking for working alloca.h... yes
    checking for alloca... yes
    checking for uid_t in sys/types.h... yes
    checking for unistd.h... (cached) yes
    checking for working chown... yes
    checking for dirent.h that defines DIR... yes
    checking for library containing opendir... none required
    checking whether closedir returns void... no
    checking for error_at_line... yes
    checking for _LARGEFILE_SOURCE value needed for large files... no
    checking whether arm-linux-gnueabihf-gcc needs -traditional... no
    checking whether lstat correctly handles trailing slash... yes
    checking whether lstat accepts an empty string... no
    checking whether lstat correctly handles trailing slash... (cached) yes
    checking for working memcmp... yes
    checking whether time.h and sys/time.h may both be included... yes
    checking for sys/time.h... yes
    checking for unistd.h... (cached) yes
    checking for stdlib.h... (cached) yes
    checking for sys/param.h... yes
    checking for utime.h... yes
    checking for alarm... yes
    checking for working mktime... yes
    checking for getpagesize... yes
    checking for working mmap... yes
    checking sys/select.h usability... yes
    checking sys/select.h presence... yes
    checking for sys/select.h... yes
    checking sys/socket.h usability... yes
    checking sys/socket.h presence... yes
    checking for sys/socket.h... yes
    checking types of arguments for select... int,fd_set *,struct timeval *
    checking return type of signal handlers... void
    checking whether stat accepts an empty string... no
    checking for working strcoll... yes
    checking for strftime... yes
    checking for working strtod... yes
    checking whether utime accepts a null argument... yes
    checking for vprintf... yes
    checking for _doprnt... no
    checking for atexit... yes
    checking for dup2... yes
    checking for fdatasync... yes
    checking for floor... no
    checking for fs_stat_dev... no
    checking for ftime... yes
    checking for ftruncate... yes
    checking for getcwd... yes
    checking for gethostbyaddr... yes
    checking for gethostbyname... yes
    checking for gethostname... yes
    checking for getpagesize... (cached) yes
    checking for getpass... yes
    checking for gettimeofday... yes
    checking for inet_ntoa... yes
    checking for lchown... yes
    checking for localeconv... yes
    checking for memchr... yes
    checking for memmove... yes
    checking for memset... yes
    checking for mkdir... yes
    checking for modf... yes
    checking for munmap... yes
    checking for pow... no
    checking for rmdir... yes
    checking for select... yes
    checking for setenv... yes
    checking for setlocale... yes
    checking for socket... yes
    checking for sqrt... no
    checking for strcasecmp... yes
    checking for strchr... yes
    checking for strcspn... yes
    checking for strdup... yes
    checking for strerror... yes
    checking for strncasecmp... yes
    checking for strpbrk... yes
    checking for strrchr... yes
    checking for strspn... yes
    checking for strstr... yes
    checking for strtol... yes
    checking for strtoul... yes
    checking for sysinfo... yes
    checking for tzset... yes
    checking for utime... yes
    checking size of int... 4
    checking size of size_t... 4
    checking sys/inotify.h usability... yes
    checking sys/inotify.h presence... yes
    checking for sys/inotify.h... yes
    checking boost/shared_ptr.hpp usability... yes
    checking boost/shared_ptr.hpp presence... yes
    checking for boost/shared_ptr.hpp... yes
    == WARNING: OpenGLES support is assumed.
    checking for mysql_config... yes
    checking ass/ass.h usability... yes
    checking ass/ass.h presence... yes
    checking for ass/ass.h... yes
    checking mpeg2dec/mpeg2.h usability... yes
    checking mpeg2dec/mpeg2.h presence... yes
    checking for mpeg2dec/mpeg2.h... yes
    checking for mpeg2dec/mpeg2convert.h... yes
    checking mad.h usability... yes
    checking mad.h presence... yes
    checking for mad.h... yes
    checking jpeglib.h usability... yes
    checking jpeglib.h presence... yes
    checking for jpeglib.h... yes
    checking samplerate.h usability... yes
    checking samplerate.h presence... yes
    checking for samplerate.h... yes
    checking ogg/ogg.h usability... yes
    checking ogg/ogg.h presence... yes
    checking for ogg/ogg.h... yes
    checking vorbis/vorbisfile.h usability... yes
    checking vorbis/vorbisfile.h presence... yes
    checking for vorbis/vorbisfile.h... yes
    checking libmodplug/modplug.h usability... yes
    checking libmodplug/modplug.h presence... yes
    checking for libmodplug/modplug.h... yes
    checking curl/curl.h usability... yes
    checking curl/curl.h presence... yes
    checking for curl/curl.h... yes
    checking FLAC/stream_decoder.h usability... yes
    checking FLAC/stream_decoder.h presence... yes
    checking for FLAC/stream_decoder.h... yes
    checking openssl/crypto.h usability... yes
    checking openssl/crypto.h presence... yes
    checking for openssl/crypto.h... yes
    checking gcrypt.h usability... yes
    checking gcrypt.h presence... yes
    checking for gcrypt.h... yes
    checking for gcry_control in -lgcrypt... yes
    checking for main in -lbz2... yes
    checking for main in -ljpeg... yes
    checking for main in -ltiff... yes
    checking for main in -lpthread... yes
    checking for main in -llzo2... yes
    checking for main in -lz... yes
    checking for main in -lcrypto... yes
    checking for main in -lssl... yes
    checking for main in -lmysqlclient... yes
    checking for sftp_tell64 in -lssh... yes
    checking for hci_devid in -lbluetooth... no
    Could not find suitable version of libbluetooth
    checking for main in -lyajl... yes
    checking for main in -ltinyxml... yes
    checking for arm-linux-gnueabihf-pkg-config... no
    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    checking for FONTCONFIG... yes
    checking for FRIBIDI... yes
    checking for SQLITE3... yes
    checking for PNG... yes
    checking for PCRE... yes
    checking for PCRECPP... yes
    checking for CDIO... yes
    checking for SAMPLERATE... yes
    checking for FREETYPE2... yes
    checking for main in -ldl... yes
    checking for main in -lresolv... yes
    checking for main in -ljasper... yes
    checking for clock_gettime in -lrt... yes
    checking for DBUS... yes
    checking for libmad soname... libmad.so.0
    checking for libogg soname... libogg.so.0
    checking for libcurl soname... libcurl-gnutls.so.4
    checking for libFLAC soname... libFLAC.so.8
    checking for libvorbis soname... libvorbis.so.0
    checking for libvorbisfile soname... libvorbisfile.so.3
    checking for libmodplug soname... libmodplug.so.1
    checking for libass soname... libass.so.4
    checking for libmpeg2 soname... libmpeg2.so.0
    checking for libmp3lame soname... libmp3lame.so.0
    checking lame/lame.h usability... yes
    checking lame/lame.h presence... yes
    checking for lame/lame.h... yes
    checking for libvorbisenc soname... libvorbisenc.so.2
    checking vorbis/vorbisenc.h usability... yes
    checking vorbis/vorbisenc.h presence... yes
    checking for vorbis/vorbisenc.h... yes
    checking for main in -lgpg-error... yes
    checking for main in -lgcrypt... yes
    checking for main in -lmicrohttpd... yes
    == ALSA support disabled. ==
    == PulseAudio support manually disabled. ==
    == HAL support disabled. ==
    checking for main in -lavahi-common... yes
    checking for main in -lavahi-client... yes
    == X11 disabled. ==
    == XRandR support disabled. SDL will be used for resolution support. ==
    configure: == GOOM disabled. ==
    configure: == RSXS disabled. ==
    configure: == ProjectM disabled. ==
    checking librtmp/log.h usability... yes
    checking librtmp/log.h presence... yes
    checking for librtmp/log.h... yes
    checking librtmp/amf.h usability... yes
    checking librtmp/amf.h presence... yes
    checking for librtmp/amf.h... yes
    checking librtmp/rtmp.h usability... yes
    checking librtmp/rtmp.h presence... yes
    checking for librtmp/rtmp.h... yes
    checking for librtmp soname... librtmp.so.0
    checking for main in -lsmbclient... yes
    configure: == NFS support disabled. ==
    checking afpfs-ng/libafpclient.h usability... no
    checking afpfs-ng/libafpclient.h presence... no
    checking for afpfs-ng/libafpclient.h... no
    configure: == Could not find libafpclient. AFP client support disabled. ==
    checking for shairport_set_ao in -lshairport... no
    configure: == Could not find libshairport. AirTunes support disabled. ==
    checking for UDEV... yes
    configure: == libusb disabled. ==
    checking for CEC... no
    == libcec disabled. CEC adapter support will not be available. ==
    configure: == libcec disabled. CEC adapter support will not be available. ==
    checking sys/capability.h usability... no
    checking sys/capability.h presence... no
    checking for sys/capability.h... no
    configure: == Could not find libcap. Capabilities detection support disabled. ==
    configure: == Use of external ffmpeg disabled. ==
    checking for python... /usr/bin/python
    checking for a version of Python >= '2.1.0'... yes
    checking for a version of Python >= 2.4... yes
    checking for the distutils Python package... yes
    checking for Python include path... -I/usr/include/python2.7
    checking for Python library path... -L/usr/lib -lpython2.7
    checking for Python site-packages path... /usr/lib/python2.7/dist-packages
    checking python extra libraries... -lssl -lcrypto  -lssl -lcrypto      -L/usr/lib -lz -lpthread -ldl  -lutil
    checking python extra linking flags... -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions
    checking consistency of all components of python development environment... yes
    configure: Using Python 2.7
    configure: == VDPAU support manually disabled. ==
    configure: == VAAPI support manually disabled. ==
    checking libcrystalhd/libcrystalhd_if.h usability... no
    checking libcrystalhd/libcrystalhd_if.h presence... no
    checking for libcrystalhd/libcrystalhd_if.h... no
    == Could not find libcrystalhd. CrystalHD support disabled. ==
    checking for libcrystalhd soname... no
    configure: WARNING: Unable to determine soname of libcrystalhd library
    configure: WARNING: libcrystalhd support disabled
    configure: == VDADecoder support manually disabled. ==
    configure: == VTBDecoder support manually disabled. ==
    configure: == OpenMax support manually disabled. ==
    checking yajl/yajl_version.h usability... yes
    checking yajl/yajl_version.h presence... yes
    checking for yajl/yajl_version.h... yes
    checking for gawk... yes
    checking for gperf... yes
    checking for unzip... yes
    checking for zip... yes
    checking for git... yes
    checking for dirent.h that defines DIR... (cached) yes
    checking for library containing opendir... (cached) none required
    checking for ANSI C header files... (cached) yes
    checking for sys/wait.h that is POSIX.1 compatible... yes
    checking arpa/inet.h usability... yes
    checking arpa/inet.h presence... yes
    checking for arpa/inet.h... yes
    checking fcntl.h usability... yes
    checking fcntl.h presence... yes
    checking for fcntl.h... yes
    checking float.h usability... yes
    checking float.h presence... yes
    checking for float.h... yes
    checking for inttypes.h... (cached) yes
    checking limits.h usability... yes
    checking limits.h presence... yes
    checking for limits.h... yes
    checking locale.h usability... yes
    checking locale.h presence... yes
    checking for locale.h... yes
    checking malloc.h usability... yes
    checking malloc.h presence... yes
    checking for malloc.h... yes
    checking for memory.h... (cached) yes
    checking netdb.h usability... yes
    checking netdb.h presence... yes
    checking for netdb.h... yes
    checking netinet/in.h usability... yes
    checking netinet/in.h presence... yes
    checking for netinet/in.h... yes
    checking stddef.h usability... yes
    checking stddef.h presence... yes
    checking for stddef.h... yes
    checking for stdint.h... (cached) yes
    checking for stdlib.h... (cached) yes
    checking for string.h... (cached) yes
    checking for strings.h... (cached) yes
    checking sys/file.h usability... yes
    checking sys/file.h presence... yes
    checking for sys/file.h... yes
    checking sys/ioctl.h usability... yes
    checking sys/ioctl.h presence... yes
    checking for sys/ioctl.h... yes
    checking sys/mount.h usability... yes
    checking sys/mount.h presence... yes
    checking for sys/mount.h... yes
    checking for sys/param.h... (cached) yes
    checking for sys/socket.h... (cached) yes
    checking for sys/time.h... (cached) yes
    checking sys/timeb.h usability... yes
    checking sys/timeb.h presence... yes
    checking for sys/timeb.h... yes
    checking sys/vfs.h usability... yes
    checking sys/vfs.h presence... yes
    checking for sys/vfs.h... yes
    checking termios.h usability... yes
    checking termios.h presence... yes
    checking for termios.h... yes
    checking for unistd.h... (cached) yes
    checking for utime.h... (cached) yes
    checking wchar.h usability... yes
    checking wchar.h presence... yes
    checking for wchar.h... yes
    checking wctype.h usability... yes
    checking wctype.h presence... yes
    checking for wctype.h... yes
    checking cdio/iso9660.h usability... yes
    checking cdio/iso9660.h presence... yes
    checking for cdio/iso9660.h... yes
    checking whether stat file-mode macros are broken... no
    checking for stdbool.h that conforms to C99... yes
    checking for _Bool... yes
    checking for an ANSI C-conforming const... yes
    checking for uid_t in sys/types.h... (cached) yes
    checking for inline... inline
    checking for int8_t... yes
    checking for int16_t... yes
    checking for int32_t... yes
    checking for int64_t... yes
    checking for mode_t... yes
    checking for off_t... yes
    checking for pid_t... yes
    checking for C/C++ restrict keyword... __restrict
    checking for size_t... (cached) yes
    checking for ssize_t... yes
    checking for struct stat.st_rdev... yes
    checking whether time.h and sys/time.h may both be included... (cached) yes
    checking whether struct tm is in sys/time.h or time.h... time.h
    checking for uint8_t... yes
    checking for uint16_t... yes
    checking for uint32_t... yes
    checking for uint64_t... yes
    checking whether byte ordering is bigendian... no
    checking for ccache... /usr/bin/ccache
    configure: enabling ccache
    configure: == DVDCSS support disabled. ==
    configure: creating ./config.status
    install prefix            /usr/local
    source path               .
    C compiler                /usr/bin/ccache arm-linux-gnueabihf-gcc
    ARCH                      arm (arm1176jzf-s)
    big-endian                no
    runtime cpu detection     yes
    ARMv5TE enabled           yes
    ARMv6 enabled             yes
    ARMv6T2 enabled           no
    ARM VFP enabled           yes
    IWMMXT enabled            no
    NEON enabled              no
    debug symbols             no
    strip symbols             yes
    optimize for size         no
    optimizations             yes
    static                    no
    shared                    yes
    postprocessing support    yes
    new filter support        yes
    network support           yes
    threading support         pthreads
    safe bitstream reader     yes
    SDL support               yes
    Sun medialib support      no
    libdxva2 enabled          no
    libva enabled             no
    libvdpau enabled          no
    AVISynth enabled          no
    frei0r enabled            no
    gnutls enabled            no
    libaacplus enabled        no
    libass enabled            no
    libcdio support           no
    libcelt enabled           no
    libdc1394 support         no
    libdirac enabled          no
    libfaac enabled           no
    libgsm enabled            no
    libmodplug enabled        no
    libmp3lame enabled        no
    libnut enabled            no
    libopencore-amrnb support no
    libopencore-amrwb support no
    libopencv support         no
    libopenjpeg enabled       no
    libpulse enabled          no
    librtmp enabled           no
    libschroedinger enabled   no
    libspeex enabled          no
    libstagefright-h264 enabled    no
    libtheora enabled         no
    libutvideo enabled        no
    libv4l2 enabled           no
    libvo-aacenc support      no
    libvo-amrwbenc support    no
    libvorbis enabled         no
    libvpx enabled            no
    libx264 enabled           no
    libxavs enabled           no
    libxvid enabled           no
    openal enabled            no
    openssl enabled           no
    zlib enabled              yes
    bzlib enabled             yes
    
    Enabled decoders:
    aac                     cscd                    mdec
    aac_latm                cyuv                    mimic
    aasc                    dca                     mjpeg
    ac3                     dfa                     mjpegb
    adpcm_4xm               dirac                   mlp
    adpcm_adx               dnxhd                   mmvideo
    adpcm_ct                dpx                     motionpixels
    adpcm_ea                dsicinaudio             mp1
    adpcm_ea_maxis_xa       dsicinvideo             mp1float
    adpcm_ea_r1             dvbsub                  mp2
    adpcm_ea_r2             dvdsub                  mp2float
    adpcm_ea_r3             dvvideo                 mp3
    adpcm_ea_xas            dxa                     mp3adu
    adpcm_g722              dxtory                  mp3adufloat
    adpcm_g726              eac3                    mp3float
    adpcm_ima_amv           eacmv                   mp3on4
    adpcm_ima_apc           eamad                   mp3on4float
    adpcm_ima_dk3           eatgq                   mpc7
    adpcm_ima_dk4           eatgv                   mpc8
    adpcm_ima_ea_eacs       eatqi                   mpeg1video
    adpcm_ima_ea_sead       eightbps                mpeg2video
    adpcm_ima_iss           eightsvx_exp            mpeg4
    adpcm_ima_qt            eightsvx_fib            mpegvideo
    adpcm_ima_smjpeg        escape124               msmpeg4v1
    adpcm_ima_wav           escape130               msmpeg4v2
    adpcm_ima_ws            ffv1                    msmpeg4v3
    adpcm_ms                ffvhuff                 msrle
    adpcm_sbpro_2           ffwavesynth             msvideo1
    adpcm_sbpro_3           flac                    mszh
    adpcm_sbpro_4           flashsv                 mxpeg
    adpcm_swf               flashsv2                nellymoser
    adpcm_thp               flic                    nuv
    adpcm_xa                flv                     pam
    adpcm_yamaha            fourxm                  pbm
    alac                    fraps                   pcm_alaw
    als                     frwu                    pcm_bluray
    amrnb                   g723_1                  pcm_dvd
    amrwb                   g729                    pcm_f32be
    amv                     gif                     pcm_f32le
    anm                     gsm                     pcm_f64be
    ansi                    gsm_ms                  pcm_f64le
    ape                     h261                    pcm_lxf
    ass                     h263                    pcm_mulaw
    asv1                    h263i                   pcm_s16be
    asv2                    h264                    pcm_s16le
    atrac1                  huffyuv                 pcm_s16le_planar
    atrac3                  idcin                   pcm_s24be
    aura                    idf                     pcm_s24daud
    aura2                   iff_byterun1            pcm_s24le
    avrp                    iff_ilbm                pcm_s32be
    avs                     imc                     pcm_s32le
    bethsoftvid             indeo2                  pcm_s8
    bfi                     indeo3                  pcm_s8_planar
    bink                    indeo4                  pcm_u16be
    binkaudio_dct           indeo5                  pcm_u16le
    binkaudio_rdft          interplay_dpcm          pcm_u24be
    bintext                 interplay_video         pcm_u24le
    bmp                     jpeg2000                pcm_u32be
    bmv_audio               jpegls                  pcm_u32le
    bmv_video               jv                      pcm_u8
    c93                     kgv1                    pcm_zork
    cavs                    kmvc                    pcx
    cdgraphics              lagarith                pgm
    cinepak                 loco                    pgmyuv
    cljr                    mace3                   pgssub
    cook                    mace6                   pictor
    png                     sp5x                    vorbis
    ppm                     srt                     vp3
    prores                  sunrast                 vp5
    prores_lgpl             svq1                    vp6
    ptx                     svq3                    vp6a
    qcelp                   targa                   vp6f
    qdm2                    theora                  vp8
    qdraw                   thp                     vqa
    qpeg                    tiertexseqvideo         wavpack
    qtrle                   tiff                    wmalossless
    r10k                    tmv                     wmapro
    r210                    truehd                  wmav1
    ra_144                  truemotion1             wmav2
    ra_288                  truemotion2             wmavoice
    rawvideo                truespeech              wmv1
    rl2                     tscc                    wmv2
    roq                     tta                     wmv3
    roq_dpcm                twinvq                  wmv3image
    rpza                    txd                     wnv1
    rv10                    ulti                    ws_snd1
    rv20                    utvideo                 xan_dpcm
    rv30                    v210                    xan_wc3
    rv40                    v210x                   xan_wc4
    s302m                   v308                    xbin
    sgi                     v410                    xl
    shorten                 vb                      xsub
    sipr                    vble                    xwd
    smackaud                vc1                     y41p
    smacker                 vc1image                yop
    smc                     vcr1                    yuv4
    snow                    vmdaudio                zlib
    sol_dpcm                vmdvideo                zmbv
    sonic                   vmnc
    
    Enabled encoders:
    aac                     ac3
    
    Enabled hwaccels:
    
    Enabled parsers:
    aac                     dvdsub                  mpegaudio
    aac_latm                flac                    mpegvideo
    ac3                     gsm                     pnm
    adx                     h261                    rv30
    cavsvideo               h263                    rv40
    dca                     h264                    vc1
    dirac                   mjpeg                   vp3
    dnxhd                   mlp                     vp8
    dvbsub                  mpeg4video
    
    Enabled demuxers:
    aac                     iff                     pcm_u24le
    ac3                     image2                  pcm_u32be
    act                     image2pipe              pcm_u32le
    adf                     ingenient               pcm_u8
    adx                     ipmovie                 pmp
    aea                     iss                     pva
    aiff                    iv8                     qcp
    amr                     ivf                     r3d
    anm                     jv                      rawvideo
    apc                     latm                    rl2
    ape                     lmlm4                   rm
    applehttp               loas                    roq
    asf                     lxf                     rpl
    ass                     m4v                     rso
    au                      matroska                rtp
    avi                     microdvd                rtsp
    avs                     mjpeg                   sap
    bethsoftvid             mlp                     sbg
    bfi                     mm                      sdp
    bink                    mmf                     segafilm
    bintext                 mov                     shorten
    bit                     mp3                     siff
    bmv                     mpc                     smacker
    c93                     mpc8                    smjpeg
    caf                     mpegps                  sol
    cavsvideo               mpegts                  sox
    cdg                     mpegtsraw               spdif
    daud                    mpegvideo               srt
    dfa                     msnwc_tcp               str
    dirac                   mtv                     swf
    dnxhd                   mvi                     thp
    dsicin                  mxf                     tiertexseq
    dts                     mxg                     tmv
    dv                      nc                      truehd
    dxa                     nsv                     tta
    ea                      nut                     tty
    ea_cdata                nuv                     txd
    eac3                    ogg                     vc1
    ffm                     oma                     vc1t
    ffmetadata              pcm_alaw                vmd
    filmstrip               pcm_f32be               voc
    flac                    pcm_f32le               vqf
    flic                    pcm_f64be               w64
    flv                     pcm_f64le               wav
    fourxm                  pcm_mulaw               wc3
    g722                    pcm_s16be               wsaud
    g723_1                  pcm_s16le               wsvqa
    g729                    pcm_s24be               wtv
    gsm                     pcm_s24le               wv
    gxf                     pcm_s32be               xa
    h261                    pcm_s32le               xbin
    h263                    pcm_s8                  xmv
    h264                    pcm_u16be               xwma
    ico                     pcm_u16le               yop
    idcin                   pcm_u24be               yuv4mpegpipe
    idf
    
    Enabled muxers:
    adts                    spdif
    
    Enabled protocols:
    applehttp               httpproxy               rtmps
    cache                   md5                     rtmpt
    concat                  mmsh                    rtmpte
    crypto                  mmst                    rtp
    file                    pipe                    tcp
    gopher                  rtmp                    udp
    http                    rtmpe
    
    Enabled filters:
    abuffer                 drawbox                 pad
    abuffersink             earwax                  pan
    aconvert                fade                    pixdesctest
    aevalsrc                fieldorder              rgbtestsrc
    aformat                 fifo                    scale
    amerge                  format                  select
    amovie                  gradfun                 setdar
    anull                   hflip                   setpts
    anullsink               hqdn3d                  setsar
    anullsrc                life                    settb
    aresample               lut                     showinfo
    ashowinfo               lutrgb                  silencedetect
    asplit                  lutyuv                  slicify
    astreamsync             mandelbrot              split
    blackframe              movie                   swapuv
    boxblur                 mp                      testsrc
    buffersink              mptestsrc               thumbnail
    cellauto                negate                  tinterlace
    color                   noformat                transpose
    copy                    null                    unsharp
    crop                    nullsink                vflip
    cropdetect              nullsrc                 volume
    delogo                  overlay                 yadif
    deshake
    
    Enabled bsfs:
    aac_adtstoasc           mjpeg2jpeg              mp3_header_decompress
    chomp                   mjpega_dump_header      noise
    dump_extradata          mov2textsub             remove_extradata
    h264_mp4toannexb        mp3_header_compress     text2movsub
    imx_dump_header
    
    Enabled indevs:
    
    Enabled outdevs:
    
    License: GPL version 2 or later
    Creating config.mak and config.h...
    configure: Skipping configuration of submodule lib/libdvd/libdvdcss.
    
    Done, type 'make install' to build and install
    cat /home/raspbian/xbmc-rbp/lib/libdvd/libdvdread/misc/dvdread-config.sh >> obj/dvdread-config
    chmod 0755 obj/dvdread-config
    
    Done, type 'make install' to build and install
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking build system type... arm-unknown-linux-gnueabihf
    checking host system type... arm-unknown-linux-gnueabihf
    checking for arm-linux-gnueabihf-gcc... /usr/bin/ccache arm-linux-gnueabihf-gcc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether /usr/bin/ccache arm-linux-gnueabihf-gcc accepts -g... yes
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to accept ISO C89... none needed
    checking for style of include used by make... GNU
    checking dependency style of /usr/bin/ccache arm-linux-gnueabihf-gcc... gcc3
    checking how to print strings... printf
    checking for a sed that does not truncate output... /bin/sed
    checking for grep that handles long lines and -e... /bin/grep
    checking for egrep... /bin/grep -E
    checking for fgrep... /bin/grep -F
    checking for ld used by /usr/bin/ccache arm-linux-gnueabihf-gcc... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
    checking the name lister (/usr/bin/nm -B) interface... BSD nm
    checking whether ln -s works... yes
    checking the maximum length of command line arguments... 1572864
    checking whether the shell understands some XSI constructs... yes
    checking whether the shell understands "+="... yes
    checking how to convert arm-unknown-linux-gnueabihf file names to arm-unknown-linux-gnueabihf format... func_convert_file_noop
    checking how to convert arm-unknown-linux-gnueabihf file names to toolchain format... func_convert_file_noop
    checking for /usr/bin/ld option to reload object files... -r
    checking for arm-linux-gnueabihf-objdump... no
    checking for objdump... objdump
    checking how to recognize dependent libraries... pass_all
    checking for arm-linux-gnueabihf-dlltool... no
    checking for dlltool... no
    checking how to associate runtime and link libraries... printf %s\n
    checking for arm-linux-gnueabihf-ar... no
    checking for ar... ar
    checking for archiver @FILE support... @
    checking for arm-linux-gnueabihf-strip... no
    checking for strip... strip
    checking for arm-linux-gnueabihf-ranlib... no
    checking for ranlib... ranlib
    checking command to parse /usr/bin/nm -B output from /usr/bin/ccache arm-linux-gnueabihf-gcc object... ok
    checking for sysroot... no
    checking for arm-linux-gnueabihf-mt... no
    checking for mt... mt
    checking if mt is a manifest tool... no
    checking how to run the C preprocessor... /usr/bin/ccache arm-linux-gnueabihf-gcc -E
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking for dlfcn.h... yes
    checking for objdir... .libs
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -fno-rtti -fno-exceptions... no
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to produce PIC... -fPIC -DPIC
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc PIC flag -fPIC -DPIC works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc static flag -static works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... (cached) yes
    checking whether the /usr/bin/ccache arm-linux-gnueabihf-gcc linker (/usr/bin/ld) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... no
    checking for ANSI C header files... (cached) yes
    checking assert.h usability... yes
    checking assert.h presence... yes
    checking for assert.h... yes
    checking for unistd.h... (cached) yes
    checking zlib.h usability... yes
    checking zlib.h presence... yes
    checking for zlib.h... yes
    checking for an ANSI C-conforming const... yes
    checking for inline... inline
    checking for ftruncate... yes
    checking for compress2 in -lz... yes
    checking whether to enable profiling... no
    checking whether to enable debugging... default
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating msvc++/Makefile
    config.status: creating libid3tag.list
    config.status: creating config.h
    config.status: executing depfiles commands
    config.status: executing libtool commands
    configure: Skipping configuration of submodule xbmc/visualizations/XBMCProjectM/libprojectM.
    configure: Skipping configuration of submodule xbmc/visualizations/Goom/goom2k4-0.
    configure: Skipping configuration of submodule xbmc/screensavers/rsxs-0.9/.
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether to enable maintainer-specific portions of Makefiles... no
    checking build system type... arm-unknown-linux-gnueabihf
    checking host system type... arm-unknown-linux-gnueabihf
    checking for arm-linux-gnueabihf-gcc... /usr/bin/ccache arm-linux-gnueabihf-gcc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether /usr/bin/ccache arm-linux-gnueabihf-gcc accepts -g... yes
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to accept ISO C89... none needed
    checking for style of include used by make... GNU
    checking dependency style of /usr/bin/ccache arm-linux-gnueabihf-gcc... gcc3
    checking how to print strings... printf
    checking for a sed that does not truncate output... /bin/sed
    checking for grep that handles long lines and -e... /bin/grep
    checking for egrep... /bin/grep -E
    checking for fgrep... /bin/grep -F
    checking for ld used by /usr/bin/ccache arm-linux-gnueabihf-gcc... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
    checking the name lister (/usr/bin/nm -B) interface... BSD nm
    checking whether ln -s works... yes
    checking the maximum length of command line arguments... 1572864
    checking whether the shell understands some XSI constructs... yes
    checking whether the shell understands "+="... yes
    checking how to convert arm-unknown-linux-gnueabihf file names to arm-unknown-linux-gnueabihf format... func_convert_file_noop
    checking how to convert arm-unknown-linux-gnueabihf file names to toolchain format... func_convert_file_noop
    checking for /usr/bin/ld option to reload object files... -r
    checking for arm-linux-gnueabihf-objdump... no
    checking for objdump... objdump
    checking how to recognize dependent libraries... pass_all
    checking for arm-linux-gnueabihf-dlltool... no
    checking for dlltool... no
    checking how to associate runtime and link libraries... printf %s\n
    checking for arm-linux-gnueabihf-ar... no
    checking for ar... ar
    checking for archiver @FILE support... @
    checking for arm-linux-gnueabihf-strip... no
    checking for strip... strip
    checking for arm-linux-gnueabihf-ranlib... no
    checking for ranlib... ranlib
    checking command to parse /usr/bin/nm -B output from /usr/bin/ccache arm-linux-gnueabihf-gcc object... ok
    checking for sysroot... no
    checking for arm-linux-gnueabihf-mt... no
    checking for mt... mt
    checking if mt is a manifest tool... no
    checking how to run the C preprocessor... /usr/bin/ccache arm-linux-gnueabihf-gcc -E
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking for dlfcn.h... yes
    checking for objdir... .libs
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -fno-rtti -fno-exceptions... no
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to produce PIC... -fPIC -DPIC
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc PIC flag -fPIC -DPIC works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc static flag -static works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... (cached) yes
    checking whether the /usr/bin/ccache arm-linux-gnueabihf-gcc linker (/usr/bin/ld) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... yes
    checking for main in -lc... yes
    checking for main in -lm... yes
    checking for string.h... (cached) yes
    checking stdio.h usability... yes
    checking stdio.h presence... yes
    checking for stdio.h... yes
    checking for stdlib.h... (cached) yes
    checking stddef.h usability... yes
    checking stddef.h presence... yes
    checking for stddef.h... yes
    checking stdarg.h usability... yes
    checking stdarg.h presence... yes
    checking for stdarg.h... yes
    checking for string.h... (cached) yes
    checking limits.h usability... yes
    checking limits.h presence... yes
    checking for limits.h... yes
    checking assert.h usability... yes
    checking assert.h presence... yes
    checking for assert.h... yes
    checking math.h usability... yes
    checking math.h presence... yes
    checking for math.h... yes
    checking for main in -lid3... no
    checking id3.h usability... no
    checking id3.h presence... no
    checking for id3.h... no
    checking for stdlib.h... (cached) yes
    checking for GNU libc compatible malloc... yes
    checking for memcpy... yes
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating config.h
    config.status: executing depfiles commands
    config.status: executing libtool commands
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether NLS is requested... no
    checking for msgfmt... /usr/bin/msgfmt
    checking for gmsgfmt... /usr/bin/msgfmt
    checking for xgettext... /usr/bin/xgettext
    checking for msgmerge... /usr/bin/msgmerge
    checking for style of include used by make... GNU
    checking for arm-linux-gnueabihf-gcc... /usr/bin/ccache arm-linux-gnueabihf-gcc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether /usr/bin/ccache arm-linux-gnueabihf-gcc accepts -g... yes
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to accept ISO C89... none needed
    checking dependency style of /usr/bin/ccache arm-linux-gnueabihf-gcc... gcc3
    checking build system type... arm-unknown-linux-gnueabihf
    checking host system type... arm-unknown-linux-gnueabihf
    checking for ld used by GCC... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for shared library run path origin... done
    checking for CFPreferencesCopyAppValue... no
    checking for CFLocaleCopyCurrent... no
    checking whether to use NLS... no
    checking for arm-linux-gnueabihf-gcc... (cached) /usr/bin/ccache arm-linux-gnueabihf-gcc
    checking whether we are using the GNU C compiler... (cached) yes
    checking whether /usr/bin/ccache arm-linux-gnueabihf-gcc accepts -g... (cached) yes
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to accept ISO C89... (cached) none needed
    checking dependency style of /usr/bin/ccache arm-linux-gnueabihf-gcc... (cached) gcc3
    checking whether /usr/bin/ccache arm-linux-gnueabihf-gcc and cc understand -c and -o together... yes
    checking for an ANSI C-conforming const... yes
    checking how to print strings... printf
    checking for a sed that does not truncate output... /bin/sed
    checking for grep that handles long lines and -e... /bin/grep
    checking for egrep... /bin/grep -E
    checking for fgrep... /bin/grep -F
    checking for ld used by /usr/bin/ccache arm-linux-gnueabihf-gcc... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
    checking the name lister (/usr/bin/nm -B) interface... BSD nm
    checking whether ln -s works... yes
    checking the maximum length of command line arguments... 1572864
    checking whether the shell understands some XSI constructs... yes
    checking whether the shell understands "+="... yes
    checking how to convert arm-unknown-linux-gnueabihf file names to arm-unknown-linux-gnueabihf format... func_convert_file_noop
    checking how to convert arm-unknown-linux-gnueabihf file names to toolchain format... func_convert_file_noop
    checking for /usr/bin/ld option to reload object files... -r
    checking for arm-linux-gnueabihf-objdump... objdump
    checking how to recognize dependent libraries... pass_all
    checking for arm-linux-gnueabihf-dlltool... dlltool
    checking how to associate runtime and link libraries... printf %s\n
    checking for arm-linux-gnueabihf-ar... no
    checking for ar... ar
    checking for archiver @FILE support... @
    checking for arm-linux-gnueabihf-strip... no
    checking for strip... strip
    checking for arm-linux-gnueabihf-ranlib... no
    checking for ranlib... ranlib
    checking command to parse /usr/bin/nm -B output from /usr/bin/ccache arm-linux-gnueabihf-gcc object... ok
    checking for sysroot... no
    checking for arm-linux-gnueabihf-mt... no
    checking for mt... mt
    checking if mt is a manifest tool... no
    checking how to run the C preprocessor... /usr/bin/ccache arm-linux-gnueabihf-gcc -E
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking for dlfcn.h... yes
    checking for objdir... .libs
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -fno-rtti -fno-exceptions... no
    checking for /usr/bin/ccache arm-linux-gnueabihf-gcc option to produce PIC... -fPIC -DPIC
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc PIC flag -fPIC -DPIC works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc static flag -static works... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... yes
    checking if /usr/bin/ccache arm-linux-gnueabihf-gcc supports -c -o file.o... (cached) yes
    checking whether the /usr/bin/ccache arm-linux-gnueabihf-gcc linker (/usr/bin/ld) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking for shl_load... no
    checking for shl_load in -ldld... no
    checking for dlopen... no
    checking for dlopen in -ldl... yes
    checking whether a program can dlopen itself... yes
    checking whether a statically linked program can dlopen itself... no
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... yes
    checking whether ln -s works... yes
    checking for Posix threads... yes
    checking for dlfcn.h... (cached) yes
    checking for dlopen in -ldl... (cached) yes
    checking expat.h usability... yes
    checking expat.h presence... yes
    checking for expat.h... yes
    checking for XML_ParseBuffer in -lexpat... yes
    checking readline/readline.h usability... no
    checking readline/readline.h presence... no
    checking for readline/readline.h... no
    checking for stat... yes
    checking for lstat... yes
    checking which file name separator to use... '/'
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating libcpluff/Makefile
    config.status: creating libcpluff/cpluffdef.h
    config.status: creating libcpluff/docsrc/Makefile
    config.status: creating libcpluff/docsrc/Doxyfile-ref
    config.status: creating libcpluff/docsrc/Doxyfile-impl
    config.status: creating loader/Makefile
    config.status: creating console/Makefile
    config.status: creating po/Makefile.in
    config.status: creating doc/Makefile
    config.status: creating doc/img/Makefile
    config.status: creating docsrc/Makefile
    config.status: creating test/Makefile
    config.status: creating test/plugins-source/Makefile
    config.status: creating test/plugins-source/callbackcounter/Makefile
    config.status: creating test/plugins-source/symuser/Makefile
    config.status: creating test/plugins-source/symprovider/Makefile
    config.status: creating examples/Makefile
    config.status: creating examples/cpfile/Makefile
    config.status: creating examples/cpfile/cpfile
    config.status: creating examples/cpfile/plugins/Makefile
    config.status: creating examples/cpfile/plugins/core/Makefile
    config.status: creating examples/cpfile/plugins/special/Makefile
    config.status: creating examples/cpfile/plugins/extension/Makefile
    config.status: creating examples/cpfile/plugins/cext/Makefile
    config.status: creating config.h
    config.status: executing po-directories commands
    config.status: creating po/POTFILES
    config.status: creating po/Makefile
    config.status: executing depfiles commands
    config.status: executing libtool commands
    configure: -----------------------------------------------------------
    configure: C-Pluff configuration
    configure:   release version:                0.1.3
    configure:   multi-threading support:        yes (Posix)
    configure:   dlopening mechanism:            dlopen
    configure:   localization support:           no
    configure:   use GNU readline library:       no
    configure:   assertion checks for debugging: no
    configure:   file name separator character:  '/'
    configure:   compiler and linker settings:
    configure:     CC='/usr/bin/ccache arm-linux-gnueabihf-gcc'
    configure:     CPPFLAGS=' -I$(top_builddir) -I$(top_builddir)/libcpluff -I$(top_srcdir)/libcpluff -DNDEBUG'
    configure:     CFLAGS=' -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG=1 -O2'
    configure:     LDFLAGS=''
    configure:     LIBS=''
    configure:     LIBS_LIBCPLUFF='-lexpat -ldl '
    configure:     LIBS_OTHER='$(top_builddir)/libcpluff/libcpluff.la '
    configure:     LIB_READLINE=''
    configure:     LTLIBINTL=''
    configure: -----------------------------------------------------------
    config.status: creating .dummy
    config.status: creating Makefile
    config.status: creating Makefile.include
    config.status: creating addons/skin.confluence/media/Makefile
    config.status: creating xbmc/Makefile
    config.status: creating xbmc/cdrip/Makefile
    config.status: creating xbmc/cores/Makefile
    config.status: creating xbmc/cores/VideoRenderers/Makefile
    config.status: creating xbmc/cores/omxplayer/Makefile
    config.status: creating xbmc/cores/dvdplayer/Makefile
    config.status: creating lib/Makefile
    config.status: creating lib/libdvd/Makefile
    config.status: creating xbmc/cores/DllLoader/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDCodecs/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDCodecs/Audio/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDCodecs/Overlay/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDDemuxers/Makefile
    config.status: creating xbmc/cores/dvdplayer/DVDSubtitles/Makefile
    config.status: creating xbmc/cores/AudioEngine/Makefile
    config.status: creating xbmc/cores/paplayer/Makefile
    config.status: creating lib/timidity/Makefile
    config.status: creating lib/xbadpcm/Makefile
    config.status: creating lib/asap/Makefile
    config.status: creating lib/nosefart/Makefile
    config.status: creating lib/libsidplay2/Makefile
    config.status: creating lib/vgmstream/Makefile
    config.status: creating lib/snesapu/SNES/SNESAPU/Makefile
    config.status: creating lib/stsound/StSoundLibrary/Makefile
    config.status: creating xbmc/cores/playercorefactory/Makefile
    config.status: creating xbmc/music/karaoke/Makefile
    config.status: creating xbmc/osx/Makefile
    config.status: creating xbmc/guilib/Makefile
    config.status: creating xbmc/interfaces/Makefile
    config.status: creating xbmc/network/Makefile
    config.status: creating lib/libRTV/Makefile
    config.status: creating lib/libexif/Makefile
    config.status: creating lib/libXDAAP/Makefile
    config.status: creating lib/cmyth/Makefile
    config.status: creating lib/libhdhomerun/Makefile
    config.status: creating lib/libsquish/Makefile
    config.status: creating lib/libid3tag/Makefile
    config.status: creating lib/cximage-6.0/Makefile
    config.status: creating lib/addons/script.module.pil/Makefile
    config.status: creating xbmc/interfaces/python/Makefile
    config.status: creating xbmc/interfaces/python/xbmcmodule/Makefile
    config.status: creating lib/libUPnP/Makefile
    config.status: creating xbmc/DllPaths_generated.h
    config.status: creating xbmc/freebsd/Makefile
    config.status: creating xbmc/linux/Makefile
    config.status: creating xbmc/filesystem/Makefile
    config.status: creating xbmc/screensavers/rsxs-0.9/xbmc/Makefile
    config.status: creating xbmc/visualizations/XBMCProjectM/Makefile
    config.status: creating xbmc/visualizations/Goom/Makefile
    config.status: creating xbmc/visualizations/OpenGLSpectrum/Makefile
    config.status: creating xbmc/visualizations/WaveForm/Makefile
    config.status: creating xbmc/visualizations/iTunes/Makefile
    config.status: creating tools/Linux/xbmc.sh
    config.status: creating tools/Linux/xbmc-standalone.sh
    config.status: creating tools/TexturePacker/Makefile
    config.status: creating tools/EventClients/Clients/OSXRemote/Makefile
    config.status: creating xbmc/peripherals/bus/Makefile
    config.status: creating xbmc/peripherals/devices/Makefile
    config.status: creating xbmc/config.h
    config.status: executing depfiles commands
    config.status: executing libtool commands
    
    ------------------------
      XBMC Configuration:
    ------------------------
      Debugging:    No
      Profiling:    No
      Optimization: Yes
      Crosscomp.:   No
      target ARCH:  arm
      target CPU:   arm1176jzf-s
      OpenGLES:     Yes
      ALSA:         No
      DBUS:         Yes
      VDPAU:        No
      VAAPI:        No
      CrystalHD:    No
      VDADecoder:   No
      VTBDecoder:   No
      OpenMax:      No
      Joystick:     No
      XRandR:       No
      GOOM:         No
      RSXS:         Yes
      ProjectM:     No
      Skin Touched: No
      X11:          No
      Bluray:       No
      TexturePacker:Yes
      MID Support:  Yes
      ccache:       Yes
      ALSA Support: No
      PulseAudio:   No
      HAL Support:  No
      DVDCSS:       No
      Avahi:        Yes
      Non-free:     Yes
      ASAP Codec:   No
      Webserver:    Yes
      libRTMP support:      Yes
      libsmbclient support: Yes
      libnfs client support:No
      libafpclient support: No
      AirPLay support:      No
      AirTunes support:     No
      Optical drive:        No
      libudev support:      Yes
      libusb support:       No
      libcec support:       No
      libmp3lame support:   Yes
      libvorbisenc support: Yes
      libcap support:       No
      External FFmpeg:      No
      prefix:       /usr
    ```
