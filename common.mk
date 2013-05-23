# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
  	
    
# Configuration files for audio
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/etc/init.d/10soundbooster:system/etc/init.d/10soundbooster \

# Usb
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/etc/vold.fstab:system/etc/vold.fstab \

# Keychars
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/alcatel/bcm21553-common/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \

# Keymap
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/alcatel/bcm21553-common/prebuilt/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    device/alcatel/bcm21553-common/prebuilt/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl \

# Bluetooth
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \


# GPS
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/etc/gps.conf:system/etc/gps.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/alcatel/bcm21553-common/prebuilt/lib/libnetutils.so:system/lib/libnetutils.so \
    device/alcatel/bcm21553-common/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/alcatel/bcm21553-common/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
#    device/alcatel/bcm21553-common/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs \
    device/alcatel/bcm21553-common/prebuilt/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/alcatel/bcm21553-common/prebuilt/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \

# HGL
#PRODUCT_COPY_FILES += \
    device/alcatel/bcm21553-common/prebuilt/lib/egl/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so \

# Gralloc
#PRODUCT_COPY_FILES += \
#	device/alcatel/bcm21553-common/prebuilt/lib/hw/gralloc.bcm21553.so:system/lib/hw/gralloc.default.so 

# Enable if you build open Gralloc, then disable the prebuilt gralloc
#PRODUCT_PACKAGES += \
#    	gralloc.bcm21553

# Media scanner apps
#PRODUCT_COPY_FILES += \
#    	device/alcatel/bcm21553-common/prebuilt/app/MediaPlayer.apk:system/app/MediaPlayer.apk \

#Media Scanner libs
#PRODUCT_COPY_FILES += \
#	device/alcatel/bcm21553-common/prebuilt/lib/libandless.so:system/lib/libandless.so \

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=20 \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 \

# Enable Google-specific location features, like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Note for the kernel:
#    * This kernel is not compatible with your device, it's just for build the ROM
#    * Delete the boot.img inside your package and modify update-script to not install kernel

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/alcatel/bcm21553-common/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel