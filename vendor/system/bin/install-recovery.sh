#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13262848 5418c9c21ce6885596962a8fef975b18a04f8b4d 10452992 beb6655cafa24434aa70d68e0b235ef2fdae1114
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13262848:5418c9c21ce6885596962a8fef975b18a04f8b4d; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10452992:beb6655cafa24434aa70d68e0b235ef2fdae1114 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 5418c9c21ce6885596962a8fef975b18a04f8b4d 13262848 beb6655cafa24434aa70d68e0b235ef2fdae1114:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
