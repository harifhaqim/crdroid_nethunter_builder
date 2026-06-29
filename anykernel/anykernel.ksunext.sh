## AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=crDroid 12 Nethunter Kernel by MikhailSimon
do.devicecheck=1
do.modules=0
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
ui_print "    NetHunter Kernel  - Linux 5.4.302          ";
ui_print "    POCO X5 5G  /  Redmi Note 12 5G             ";
ui_print "================================================";
ui_print " ";

## AnyKernel install
split_boot;
flash_boot;

## NetHunter: install Realtek .ko as a self-contained KSU Next module.
## AnyKernel3's built-in module path requires Magisk or classic KSU; KSU Next
## (com.rifsxd.ksunext) is not detected, so we install manually.
install_nethunter_realtek_module() {
  local SRC="$AKHOME/ksu_module";
  local DEST="/data/adb/modules/nethunter-realtek-drivers";

  [ -d "$SRC" ] || return 0;
  [ -d /data/adb ] || { ui_print " " "Warning: /data/adb missing — skipping Realtek module install"; return 0; }

  ui_print " " "Installing Realtek drivers as KSU Next module...";
  rm -rf "$DEST";
  mkdir -p "$DEST";
  cp -rf "$SRC"/. "$DEST"/;
  set_perm_recursive 0 0 0755 0644 "$DEST";
  [ -f "$DEST/service.sh"      ] && set_perm 0 0 0755 "$DEST/service.sh";
  [ -f "$DEST/post-fs-data.sh" ] && set_perm 0 0 0755 "$DEST/post-fs-data.sh";
  touch "$DEST/update";
  ui_print "  -> /data/adb/modules/nethunter-realtek-drivers";
}
install_nethunter_realtek_module;
## end install
