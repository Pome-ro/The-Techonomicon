# Installing Powershell on Chromebook
Was trying to figure out how to install Powershell on Linux for Chromebooks

## URLs
 - https://www.reddit.com/r/Crostini/comments/90ycnq/install_current_release_of_powershell/
 - https://kmyers.me/blog/chromeos/installing-microsoft-powershell-on-chrome-os-with-project-crostini/

## Archive of Reddit Comment:
### Comment URL
https://www.reddit.com/r/Crostini/comments/90ycnq/install_current_release_of_powershell/ecfuilh?utm_source=share&utm_medium=web2x
### Posted by: [/u/toalysium](https://www.reddit.com/user/toalysium/)

In case someone else has this issue more recently: I first tried the official instructions for Ubuntu 18.04 and then found this page. I then followed u/KeithIMeyers guide and it almost worked, but... It threw up the exact same dependency errors as the official version. Looking at the pwsh github page it appears as though that's a common problem when new versions of the dependency are released and installed, but maybe not pushed to the .deb?

These are the errors I was getting with Keith's instructions:

```bash
toalysium@penguin:~/powershell$ sudo apt-get install -y powershell
Reading package lists... Done
Building dependency tree
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 powershell : Depends: libssl1.0.0 but it is not installable
              Depends: libicu60 but it is not installable
E: Unable to correct problems, you have held broken packages.
```
I looked around and found this: https://github.com/dotnet/core-sdk/issues/93 and figured it was a similar issue. I changed the Ubuntu version in the wget command and then tried to install powershell again, and it worked as below.
```bash
toalysium@penguin:~/powershell$ wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

toalysium@penguin:~/powershell$ sudo dpkg -i packages-microsoft-prod.deb
(Reading database ... 50516 files and directories currently installed.)
Preparing to unpack packages-microsoft-prod.deb ...
Unpacking packages-microsoft-prod (1.0-ubuntu18.04.1) over (1.0-ubuntu18.04.1) ...
Setting up packages-microsoft-prod (1.0-ubuntu18.04.1) ...

toalysium@penguin:~/powershell$ sudo apt-get install -y powershell
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  powershell
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 58.1 MB of archives.
After this operation, 158 MB of additional disk space will be used.
Get:1 https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch/main amd64 powershell amd64 6.1.1-1.debian.9 [58.1 MB]
Fetched 58.1 MB in 2s (24.1 MB/s)
Selecting previously unselected package powershell.
(Reading database ... 50516 files and directories currently installed.)
Preparing to unpack .../powershell_6.1.1-1.debian.9_amd64.deb ...
Unpacking powershell (6.1.1-1.debian.9) ...
Setting up powershell (6.1.1-1.debian.9) ...

toalyisum@penguin:~/powershell$ pwsh
PowerShell 6.1.1
Copyright (c) Microsoft Corporation. All rights reserved.
```
