# Raspbian Repository

## Location

The master Raspbian repository can be found at the following link:

<http://archive.raspbian.org/>

## Packages

A current list of packages within the Raspbian repository can be found
in the **Packages** text file linked below:

<http://archive.raspbian.org/raspbian/dists/wheezy/main/binary-armhf/Packages>

## Sources.list File

The **/etc/apt/sources.list** file contains the information that
Raspbian needs to install additional software packages on your Raspberry
Pi using apt-get - the Package installer for Raspbian. This file should
contain the following information:

    deb http://archive.raspbian.org/raspbian wheezy main
    deb-src http://archive.raspbian.org/raspbian wheezy main

When using apt-get, you will will want to install the Raspbian public
key in your apt-get keyring. This can be done with following command:

    wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -

## Mirrors

Mirrors of Raspbian that may be more suitable for users in different
geographic locations can be found [here](RaspbianMirrors).
