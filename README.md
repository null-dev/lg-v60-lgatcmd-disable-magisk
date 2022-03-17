# Magisk Module for disabling LG lgatcmd

Prevents Android from continuously attempting to start the service even when the package is uninstalled.

Works by injecting an override for the LG lgatcmd service and the framework VINTF manifest into the boot image.

## WARNING THIS MODULE PERFORMS DANGEROUS LOW LEVEL ACTIONS
In the worst case this module may even prevent your device from booting! It is extremely important that you make a backup of your boot image before you install this module!

Download here: https://github.com/null-dev/lg-v60-lgatcmd-disable-magisk/raw/master/lg-v60-lgatcmd-disable-magisk.zip
