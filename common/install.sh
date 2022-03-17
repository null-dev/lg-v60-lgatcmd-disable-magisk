get_flags
find_boot_image

ui_print "Unpacking boot image ($BOOTIMAGE)..."
"$NVBASE/magisk/magiskboot" unpack "$BOOTIMAGE"

ui_print "Adding overlay scripts to ramdisk..."
"$NVBASE/magisk/magiskboot" cpio ramdisk.cpio \
"mkdir 0700 overlay.d" \
"add 0700 overlay.d/lg-disable-lgatcmd.rc $MODPATH/ramdisk/init.rc" \
"mkdir 0755 overlay.d/system" \
"mkdir 0755 overlay.d/system/etc" \
"mkdir 0755 overlay.d/system/etc/vintf" \
"add 0744 overlay.d/system/etc/vintf/manifest.xml $MODPATH/ramdisk/manifest.xml"

ui_print "Repacking boot image..."
"$NVBASE/magisk/magiskboot" repack "$BOOTIMAGE"

ui_print "Flashing new boot image..."
if ! flash_image new-boot.img "$BOOTIMAGE"; then
    abort "Failed to flash new boot image!"
fi
