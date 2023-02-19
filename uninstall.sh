adb root
adb remount
adb shell mount -o remount,rw /
adb shell rm  /system/bin/uinput-titan
adb shell rm  /system/etc/init/titan.rc
adb shell rm  /system/usr/idc/titan-uinput.idc
adb push resources/keyboard/Android10/system_usr_idc/* /system/usr/idc/
adb push resources/keyboard/Android10/system_usr_keychars/* /system/usr/keychars/
adb push resources/keyboard/Android10/system_usr_keylayout/* /system/usr/keylayout/
# adb reboot
