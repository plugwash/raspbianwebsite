# Raspbian Repository

The Raspbian repository is the entire set of Raspbian packages organized
in a special on-line directory tree which can be used to install
thousands of additional software packages on your Raspberry Pi.

The master Raspbian repository can be found at the following link:

<http://archive.raspbian.org/>

Mirrors of the Raspbian repository that may be more suitable for users
in different geographic locations can be found [here](RaspbianMirrors).

## Repository sources.list File

The **/etc/apt/sources.list** file contains the information needed to
install additional software packages on your Raspberry Pi from the
Raspbian repository. This file should contain the following information:

  - ``` 
    deb http://archive.raspbian.org/raspbian wheezy main contrib non-free
    deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free
    ```

If needed, the Raspbian public key can be stored into your apt-get
keyring using the following command:

  - ``` 
    wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -
    ```

## Repository Bandwidth

Bandwidth statistics of the Raspbian repository can be found
[here](http://www.raspbian.org/mrtg/localhost_eth0.html).
