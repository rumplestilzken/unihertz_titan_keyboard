adb root
adb remount # This may require a reboot
adb shell mount -o remount,rw /
adb push resources/keyboard/Android10_function/system_usr_idc/* /system/usr/idc/
adb push resources/keyboard/Android10_function/system_usr_keychars/* /system/usr/keychars/
adb push resources/keyboard/Android10_function/system_usr_keylayout/* /system/usr/keylayout/
# adb push resources/uinput-titan/uinput-titan /system/bin/uinput-titan
# adb push resources/uinput-titan/titan.rc /system/etc/init/
# adb push resources/uinput-titan/titan-uinput.idc /system/usr/idc/
# adb reboot
