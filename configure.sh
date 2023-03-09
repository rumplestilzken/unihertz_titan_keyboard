adb root
adb shell settings put system screen_off_timeout 600000
adb shell settings put system display_density_forced 320
adb shell settings put system system navigation_mode 2
adb shell settings put system --lineage navigation_bar_hint 0
adb shell settings put secure show_ime_with_hard_keyboard 1
echo Configure Complete.
