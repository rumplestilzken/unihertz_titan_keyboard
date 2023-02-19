## references
- titan tips: https://unihertz-titan.neocities.org
- discord with a ton information: https://discord.gg/PxnUeM8

## Install

### Dependencies!!

1) Setup adb and fastboot on your computer
https://www.xda-developers.com/install-adb-windows-macos-linux/

2) enable adb debugging on your phone. Same guide above has instructions.

### Keyboard configuration

These map the keyboard properly, and remove the annoying cursor. Keyboard touchpad functionality is a bit trickier and is expanded on in a later section.

```
sudo chmod +x configure.sh install.sh uninstall.sh
```
### Install
To install keyboard software, run this script
```
./install.sh
```

### Removal
If you want to remove the installed software, run this script
```
./uninstall.sh
```

### Further keyboard configuration
I use Key Mapper from Fdroid to remap the red side key to CTRL. Doing this with keylayout files doesn't work since android doesn't let the two keyboards interact. Remapping this with uinput-titan also doesn't work for a number of reasons.

### Setting Configuration
This sets the display timeout to 5 minutes, scales down the display, and changes to gesture navigation, and hides the navigation hint
```
./configure.sh
```

#### Functionalities

##### Added keyboard functionality
  - shift+alt to access programming layer.
  - short pressing the App Switch key also toggles on the programming layer. Long pressing activates the app switcher as usual.

```
| ; | | | [ | ] | { | } |   |   |   |     |
| & | ` | ^ | = | % | ← | ↓ | ↑ | → | del |
|   | < | > |   |   |   |   |   |   |     |
```
  
#### Design / TODO
TODO: add functionality: double tap on trackpad to enter cursor scrolling mode
- TODO: swipes left and right are remapped to arrow keys, or use volume arrow keys? if use volume arrows, get adb command.
- TODO: double tap on space mapped to tab


### software keyboard 

ruKeyboard or anysoft

info on https://unihertz-titan.neocities.org

or install the Kika-Input from [here](https://drive.google.com/file/d/1kF2TeQoWGVGNJTi3wL3EHX7PruQJ5D8f/view?usp=share_link)

### useful adb debugging commands
```
adb logcat | grep "UINPUT"
```
```
adb shell getevent -i
```
```
adb shell getevent -v
```

# kernel research

### keyboard
Looking into the driver of the titan keyboard, logs seem to call it aw9523_key
I can find two different references to a driver by this name, both in odd places. 
the first is a random git gist: https://gist.github.com/tablatronix/318368fd0f66958f413f0ac24a2a50e9 which implies it is from 2017
the second is from the gemian project: https://github.com/gemian/cosmo-linux-kernel-4.4/tree/master/drivers/misc/mediatek/aw9523 which seems to have originated in 2016. Both seem to be originally authored by AWINIC Technology CO who are the makers of the aw9523 gpio expander. 

Based on the log formatting:

aw9523_key_work: cnt = 30 key_report: p0-row=4, p1-col=2, key_code=158, key_val=1 keymap5 --- 2


it seems the titan is running a modified version of the one from the random gist. Unfortunately there isn't any sign of an aw9523 driver in the upstream android driver, or upstream linux.

That said, early this year someone tried to get a basic driver for the chip into upstream linux: https://www.spinics.net/lists/devicetree/msg402971.html

This gives some hope that we could get the keyboard working on a build of the upstream android kernel.
the fxtec pro1 uses the same chip for its keyboard, and the sailfish os folks use this driver that could also be modified to work https://github.com/sailfish-on-fxtecpro1/kernel-fxtec-pro1/blob/hybris-msm-aosp-9.0/drivers/input/keyboard/aw9523b.c


# Thanks to:
@ValdikSS - owner of https://unihertz-titan.neocities.org, patched boot.img for magisk, and twrp builds
          - much of this information comes from them, and I am just organizing it here
          
@phhusson - for the great base android GSI images
          - for the core of uinput-titan
@SolidHal - for base of this repository
