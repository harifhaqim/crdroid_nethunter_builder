## AnyKernel3 Ramdisk Mod Script — Magisk variant (no built-in KSU)
## osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=crDroid 12 Nethunter Kernel by MikhailSimon
do.devicecheck=1
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=gemstone
device.name2=moonstone
device.name3=sunstone
device.name4=stone
supported.versions=
supported.patchlevels=
'; }

# boot shell variables
block=boot;
is_slot_device=auto;

## AnyKernel methods (DO NOT CHANGE)
. tools/ak3-core.sh;

## ── Banner + educational-use warning ────────────────────────────────────────
ui_print " ";
ui_print "================================================";
ui_print "    NetHunter Kernel  ·  Linux 5.4.302          ";
ui_print "    POCO X5 5G  /  Redmi Note 12 5G             ";
ui_print "                                                ";
ui_print "    Root: provide via Magisk after first boot.  ";
ui_print "                                                ";
ui_print "================================================";
ui_print " ";

## AnyKernel install
## With do.modules=1 + do.systemless=1, AnyKernel3 places .ko files in
## modules/system/lib/modules/ and patches the kernel for Magisk-systemless
## module loading. The user must flash Magisk separately to activate them.
split_boot;
flash_boot;
## end install
