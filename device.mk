#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#
#EGL Implementation

PRODUCT_PACKAGES += libGLES_android

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Realme XT is a product launched with pie
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
   $(LOCAL_PATH)/overlay \
   $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk

# Properties
include device/realme/RMX1921/configs/vendor_prop.mk

#Permissions
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml
#    $(QCPATH)/commonsys-intf/telephony/build/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml \ #doesnotexist in lineage
#    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml \
# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

#Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    android.frameworks.displayservice@1.0

#Device uses high density artwork when available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Include the AOSP embedded configuration but strip display related modules out
#include build/target/product/base_system.mk
#include build/target/product/base_vendor.mk

#PRODUCT_PACKAGES += \
                              blank_screen \
                              bootanimation \
                              libgui \
                              libpixelflinger \
                              libsurfaceflinger \
                              libsurfaceflinger_ddmconnection \
                              surfaceflinger \
                              libui \
                              surfaceflinger \
                              appwidget \
                              BackupRestoreConfirmation \
                              android.test.base \
                              android.test.mock \
                              android.test.runner \
                              audioserver \
                              app_process \
                              cameraserver \
                              com.android.location.provider \
                              ContactsProvider \
                              DefaultContainerService \
                              DownloadProvider \
                              ExtServices \
                              ExtShared \
                              ims-common \
                              libaaudio \
                              libamidi \
                              libandroid \
                              libandroidfw \
                              libandroid_runtime \
                              libandroid_servers \
                              libaudioeffect_jni \
                              libaudioflinger \
                              libaudiopolicymanager \
                              libaudiopolicyservice \
                              libaudioutils \
                              libcamera2ndk \
                              libcamera_client \
                              libcameraservice \
                              libdrmframework \
                              libdrmframework_jni \
                              libEGL \
                              libETC1 \
                              libFFTEm \
                              libGLESv1_CM \
                              libGLESv2 \
                              libGLESv3 \
                              libgui \
                              libmedia \
                              libmedia_jni \
                              libmediandk \
                              libmediaplayerservice \
                              libsoundpool \
                              libsoundtrigger \
                              libsoundtriggerservice \
                              libstagefright \
                              libstagefright_amrnb_common \
                              libstagefright_enc_common \
                              libstagefright_foundation \
                              libstagefright_omx \
                              libwifi-service \
                              media \
                              media_cmd \
                              mediadrmserver \
                              mediaextractor \
                              mediametrics \
                              MediaProvider \
                              mediaserver \
                              PackageInstaller \
                              PermissionController \
                              SettingsProvider \
                              telecom \
                              telephony-common \
                              voip-common \
                              WallpaperBackup \
                              wificond \
                              wifi-service \
                              wm

#@inherit:build/target/product/runtime_libart.mk

#PRODUCT_PACKAGES := $(filter-out $(_MINIMAL_STRIP_MODULES),$(PRODUCT_PACKAGES))
#PRODUCT_BOOT_JARS := $(filter-out telephony-common voip-common ims-common,$(PRODUCT_BOOT_JARS))

# Fastboot
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-RMX1921
PRODUCT_COPY_FILES += $(LOCAL_PATH)/rootdir/fstab_AB_variant.qcom:$(TARGET_OUT_VENDOR)/etc/fstab.qcom

# A/B System
ENABLE_AB := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
      boot \
      vendor \
      system

PRODUCT_PACKAGES := \
  update_engine \
  update_engine_client \
  update_verifier \
  android.hardware.boot@1.0-impl \
  android.hardware.boot@1.0-service
  
PRODUCT_HOST_PACKAGES += brillo_update_payload

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

#AMPLOADER
PRODUCT_PACKAGES += amploader

#BRCTL
PRODUCT_PACKAGES += \
     brctl \
     libbridge

#BSON
PRODUCT_PACKAGES += libbson

#ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.broadcastradio@1.0-impl

#ANGLE
PRODUCT_PACKAGES += libangle

#APPOPS_POLICY
PRODUCT_PACKAGES += appops_policy.xml

#ATRACE_HAL
PRODUCT_PACKAGES += android.hardware.atrace@1.0-service

#Bluetooth
PRODUCT_PACKAGES += \
  javax.btobex \
  libattrib_static \
  libbt-vendor \
  libbthost_if \
  libbt-logClient \
  libbluetooth_qti \
  libbt-hidlclient

#Boot control HAL test app ( Debug )
PRODUCT_PACKAGES_DEBUG += bootctl

PRODUCT_PACKAGES += \
  bootctrl.sdm710 \
  libz \
  libcutils \
  update_engine_sideload

# Audio
# for HIDL related packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.audio@5.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@5.0-impl \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.sdm710 \
    audio.primary.default

PRODUCT_PACKAGES += \
    AudioSettings \
    VoicePrintTest \
    VoicePrintDemo

PRODUCT_PACKAGES += \
   snd_soc_msm_Taiko \
   snd_soc_msm_Taiko_CDP \
   snd_soc_msm_Taiko_liquid

PRODUCT_PACKAGES += \
   fs_config_files \
   android.hardware.media.omx@1.0-impl

PRODUCT_PACKAGES += audio_policy.conf

# HAL Wrapper
PRODUCT_PACKAGES += \
      libqahw \
      libqahwwrapper

# HAL Test app
PRODUCT_PACKAGES += \
         hal_play_test \
         hal_rec_test

#tinyalsa test apps
PRODUCT_PACKAGES += \
               tinyplay \
               tinycap \
               tinymix \
               tinypcminfo \
               cplay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:vendor/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    $(LOCAL_PATH)/audio/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(LOCAL_PATH)/audio/mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuw.xml \
    $(LOCAL_PATH)/audio/mixer_paths_360cam.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_360cam.xml \
    $(LOCAL_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_PATH)/audio/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_i2s.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skuw.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_skuw.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml
    
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

#vendor/qcom/opensource/audio-hal/primary-hal/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml #Doesnot exist

#Listen configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries-qti.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

#C2DColorConvert
PRODUCT_PACKAGES += libc2dcolorconvert

PRODUCT_PACKAGES += \
   libwebviewchromium \
   libwebviewchromium_loader \
   libwebviewchromium_plat_support


#CIMAX
PRODUCT_PACKAGES += libcimax_spi

#CONNECTIVITY
PRODUCT_PACKAGES += \
   libcnefeatureconfig \
   cneapiclient \
   services-ext

#CURL
PRODUCT_PACKAGES += \
      libcurl \
      curl

#Display related packages and configuration
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    vendor.qti.hardware.display.allocator@1.0-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    modetest \
    gralloc.default \
    gralloc.sdm710 \
    lights.sdm710 \
    hwcomposer.sdm710 \
    memtrack.default \
    memtrack.sdm710 \
    libqdutils \
    libqdMetaData

#Qdcm calibration xml file for 2k panel
#PRODUCT_COPY_FILES += hardware/qcom/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml
#Qdcm calibration xml file for 2k video panel #exists on a different path but device uses different panel?
#PRODUCT_COPY_FILES += hardware/qcom/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Dual_nt35597_video_mode_dsi_truly_panel_without_DSC.xml #exists on a different path but device uses different panel?

#DASH
PRODUCT_PACKAGES += \
   libdashplayer \
   libqcmediaplayer \
   qcmediaplayer \
   libextmedia_jni

#DATA_OS
PRODUCT_PACKAGES += librmnetctl

#EXTENDEDMEDIA_EXT
PRODUCT_PACKAGES += \
   libextendedmediaextractor \
   libextendedmediaextractor_jni \
   extendedmediaextractor \
   ExtendedMediaPlayer

# Context hub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-impl-qti \
    android.hardware.keymaster@4.0-service-qti

# Powerhint configuration file
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# MANIFEST/MATRIX
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/configs/manifest.xml
DEVICE_MATRIX_FILE   := $(LOCAL_PATH)/configs/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(LOCAL_PATH)/configs/framework_manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/configs/vendor_framework_compatibility_matrix.xml

# To use libhealthd.msm instead of libhealthd.default
BOARD_HAL_STATIC_LIBRARIES := libhealthd.default #healthd library expanded for mode charger #only default in lineage, may as well remove this line

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := sdcard

# Enable DuerOS for voiceUI
BOARD_VOICEUI_USE_DUEROS := true

# Enable binderized USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Thermal
PRODUCT_PACKAGES += android.hardware.thermal@1.0-impl \
                    android.hardware.thermal@1.0-service \
                    thermal.sdm710
# dm-verity definitions
PRODUCT_SYSTEM_VERITY_PARTITION=/dev/block/bootdevice/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION=/dev/block/bootdevice/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true

#E2FSPROGS
PRODUCT_PACKAGES += e2fsck

#EBTABLES
PRODUCT_PACKAGES += \
  ebtables \
  ethertypes \
  libebtc

#FASTPOWERON
PRODUCT_PACKAGES += FastBoot

#GPS
PRODUCT_PACKAGES += \
 gps.conf \
 libgps.utils \
 libloc_api_v02 \
 libgnsspps \
 libgnss \
 liblocation_api \
 libbatching \
 libgeofencing \
 libsynergy_loc_api \
 android.hardware.gnss@1.0-impl-qti \
 android.hardware.gnss@1.0-service-qti \
 android.hardware.gnss@1.1-impl-qti \
 android.hardware.gnss@1.1-service-qti \
 android.hardware.gnss@2.0-impl-qti \
 android.hardware.gnss@2.0-service-qti

#HDMID
PRODUCT_PACKAGES += hdmid

#HOSTAPD
PRODUCT_PACKAGES += \
 hostapd \
 hostapd_cli \
 nt_password_hash \
 hlr_auc_gw \
 test-milenage \
 hostapd.conf \
 hostapd_default.conf \
 hostapd.deny \
 hostapd.accept

#I420COLORCONVERT
PRODUCT_PACKAGES +=f libI420colorconvert

# Ramdisk
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.debug.sh \
    init.qcom.debug-sdm710 \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.ssr.sh \
    init.qcom.testscripts.sh \
    init.qcom.usb.sh \
    init.qti.ims.sh \
    qca6234-service.sh \
    fstab_AB_variant.qcom \
    init.msm.usb.configfs.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.test.rc \
    init.recovery.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.rc \
    recovery.fstab

#IPROUTE2
PRODUCT_PACKAGES += \
 ip \
 libiprouteutil

#IPACM
PRODUCT_PACKAGES += \
 ipacm \
 IPACM_cfg.xml \
 ipacm-diag

#IPTABLES
PRODUCT_PACKAGES += \
 libiptc \
 libext \
 iptables

#KERNEL_TESTS
PRODUCT_PACKAGES += mm-audio-native-test

#KEYPAD
PRODUCT_PACKAGES += gpio-keys.kl

#KS
PRODUCT_PACKAGES += \
  ks \
  qcks \
  efsks

#LIB_NL
PRODUCT_PACKAGES += libnl_2

#LIB_XML2
PRODUCT_PACKAGES += libxml2

#LIBCAMERA
PRODUCT_PACKAGES += \
 libcamera \
 libmmcamera_interface \
 libmmcamera_interface2 \
 libmmjpeg_interface \
 libmmlib2d_interface \
 libqomx_core \
 mm-qcamera-app \
 camera_test \
 org.codeaurora.camera

#LIBCOPYBIT
PRODUCT_PACKAGES += copybit.sdm710


#LIBGESTURES
PRODUCT_PACKAGES += libgestures


#LIBAUDIOPARAM -- Exposing AudioParameter as dynamic library for SRS TruMedia to work
PRODUCT_PACKAGES += libaudioparameter

#LIBAUDIORESAMPLER -- High-quality audio resampler
PRODUCT_PACKAGES += libaudio-resampler

#LIBOPENCOREHW
PRODUCT_PACKAGES += libopencorehw

#LIBOVERLAY
PRODUCT_PACKAGES += liboverlay
PRODUCT_PACKAGES += overlay.default

#LIBGENLOCK
PRODUCT_PACKAGES += libgenlock

#LIBPERFLOCK
PRODUCT_PACKAGES += org.codeaurora.Performance

#LIBQCOMUI
PRODUCT_PACKAGES += libQcomUI

#LIBQDUTILS
PRODUCT_PACKAGES += libqdutils

#LIBQDMETADATA
PRODUCT_PACKAGES += libqdMetaData

#LIBPOWER
PRODUCT_PACKAGES += \
 power.qcom \
 android.hardware.power@1.0-impl \
 android.hardware.power@1.0-service

#LOC_API
PRODUCT_PACKAGES += libloc_api-rpc-qc

#MEDIA_PROFILES
PRODUCT_PACKAGES += media_profiles.xml

#MM_AUDIO
PRODUCT_PACKAGES += \
 libOmxAacDec \
 libOmxAacEnc \
 libOmxAmrEnc \
 libOmxEvrcEnc \
 libOmxMp3Dec \
 libOmxQcelp13Enc \
 libOmxAc3HwDec \
 libstagefright_soft_flacdec \
 libmm-omxcore \
 libOmxCore

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.0 \
    libandroid_net \
    netutils-wrapper-1.0

#Renderscript
PRODUCT_PACKAGES += android.hadware.renderscript@1.0-impl

#WFD
PRODUCT_PACKAGES += \
 libwfdaac \
 libwfdaac_vendor

PRODUCT_BOOT_JARS += \
    WfdCommon

# QMI
PRODUCT_PACKAGES += \
    libjson

# QNS ( Stock)
PRODUCT_PACKAGES += \
    libstdc++.vendor

#MM_VIDEO
PRODUCT_PACKAGES += \
 ast-mm-vdec-omx-test \
 beat \
 liblasic \
 libOmxVdec \
 libOmxVdecHevc \
 libOmxVenc \
 libOmxVidEnc \
 libOmxSwVdec \
 libOmxSwVencMpeg4 \
 libstagefrighthw \
 mm-vdec-omx-property-mgr \
 mm-venc-omx-test \
 mm-venc-omx-test720p \
 mm-video-driver-test \
 mm-video-encdrv-test \
 ExoplayerDemo \
 libaacwrapper

#OPENCORE
PRODUCT_PACKAGES += \
 libomx_aacdec_sharedlibrary \
 libomx_avcdec_sharedlibrary \
 libomx_m4vdec_sharedlibrary \
 libomx_mp3dec_sharedlibrary \
 libopencore_author \
 libopencore_common \
 libopencore_download \
 libopencore_downloadreg \
 libopencore_mp4local \
 libopencore_mp4localreg \
 libopencore_net_support \
 libopencore_player \
 libopencore_rtsp \
 libopencore_rtspreg \
 libpvplayer_engine \
 libpvauthorengine \
 pvplayer \
 pvplayer_engine_test

#PPP
PRODUCT_PACKAGES += \
 ip-up-vpn \
 libprotobuf-cpp-full

#PVOMX
PRODUCT_PACKAGES += \
  libqcomm_omx \
  01_qcomm_omx

#RF4CE
PRODUCT_PACKAGES += \
 RemoTI_RNP.cfg \
 rf4ce

#SOFTAP
PRODUCT_PACKAGES += \
 libQWiFiSoftApCfg \
 libqsap_sdk

#STK
PRODUCT_PACKAGES += Stk

#STM LOG
PRODUCT_PACKAGES += libstm-log

#TSLIB_EXTERNAL
PRODUCT_PACKAGES += \
 corgi \
 dejitter \
 inputraw \
 linear \
 variance \
 pthres \
 libtslib \
 tsprint \
 tstest \
 tsutils \
 tscalib \
 ts


#QRGND
PRODUCT_PACKAGES += \
 qrngd \
 qrngp \
 qrngtest

#WPA
PRODUCT_PACKAGES += \
  wpa_supplicant.conf \
  wpa_cli \
  wpa_supplicant_wcn.conf \
  wpa_supplicant_ath6kl.conf \
  wpa_supplicant \
  hs20-osu-client

#ZLIB
PRODUCT_PACKAGES += \
 gzip \
 libunz 

PRODUCT_HOST_PACKAGES +=  minigzip
#Charger
PRODUCT_PACKAGES += \
  charger \
  charger_res_images

#VT_JNI
PRODUCT_PACKAGES += \
  libvt_jni \
  libimscamera_jni

# VT QTI Permissions
PRODUCT_PACKAGES += qti_permissions.xml

#RCS
PRODUCT_PACKAGES += \
 rcs_service_aidl \
 rcs_service_aidl.xml \
 rcs_service_aidl_static \
 rcs_service_api \
 rcs_service_api.xml

#IMS SETTINGS
PRODUCT_PACKAGES += imssettings

#Telephony with IMS extensions
PRODUCT_PACKAGES += \
 ims-ext-common \
 ims_ext_common.xml \
 ConfURIDialer

PRODUCT_PACKAGES += \
  qti-telephony-hidl-wrapper \
  qti_telephony_hidl_wrapper.xml \
  qti-telephony-utils \
  qti_telephony_utils.xml

#CRDA
CRDA := \
 crda \
 regdbdump \
 regulatory.bin \
 linville.key.pub.pem 

#WLAN
PRODUCT_PACKAGES += \
  prima_wlan.ko \
  pronto_wlan.ko \
  qca_cld_wlan.ko

#  qca_cld3_wlan.ko (was manually added, might remove)
#FSTMAN
PRODUCT_PACKAGES += \
 fstman \
 fstman.ini

#FD_LEAK
PRODUCT_PACKAGES += libc_leak_detector

PRODUCT_PACKAGES += NrNetworkSettingApp

#Apps
PRODUCT_PACKAGES +=  \
    AccountAndSyncSettings \
    DeskClock \
    AlarmProvider \
    Calculator \
    Calendar \
    Camera \
    CellBroadcastReceiver \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery2 \
    LatinIME \
    Music \
    netutils-wrapper-1.0 \
    Phone \
    Provision \
    Protips \
    QuickSearchBox \
    Settings \
    Sync \
    SystemUI \
    Updater \
    CalendarProvider \
    SyncProvider \
    SoundRecorder \
    IM \
    VoiceDialer \
    FM2 \
    SnapdragonGallery \
    SnapdragonMusic \
    VideoEditor \
    SnapdragonLauncher \
    a4wpservice \
    wipowerservice \
    Mms \
    QtiDialer

#Bluetooth
PRODUCT_PACKAGES += \
    Bluetooth \
    BluetoothExt \
    BATestApp


# Live Wallpapers
PRODUCT_PACKAGES += \
            LiveWallpapers \
            LiveWallpapersPicker \
            VisualizationWallpapers

#DELAUN := Launcher3


# DRM (Temp workarround for b/36603742)
PRODUCT_PACKAGES += android.hidl.manager@1.0-java

PRODUCT_PACKAGES += android.hardware.drm@1.0-impl
PRODUCT_PACKAGES += android.hardware.drm@1.0-service
PRODUCT_PACKAGES += android.hardware.drm@1.1-service.widevine
PRODUCT_PACKAGES += android.hardware.drm@1.1-service.clearkey

# Don't use dynamic DRM HAL for non-go SPs

#PRODUCT_PACKAGES += android.hardware.drm@1.2-service-lazy.widevine
#PRODUCT_PACKAGES += android.hardware.drm@1.2-service-lazy.clearkey


#ifeq ($(strip $(OTA_FLAG_FOR_DRM)),true)
#PRODUCT_PACKAGES += move_widevine_data.sh
#endif
#PRODUCT_PACKAGES += move_wifi_data.sh
PRODUCT_PACKAGES += \
     librs_jni \
     libion

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Qcril configuration file
PRODUCT_PACKAGES += qcril.db

# MSM updater library
#PRODUCT_PACKAGES += librecovery_updater_msm #do not use in A/B

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno

# vcard jar
PRODUCT_PACKAGES += vcard

# tcmiface for tcm support #bootjars
#PRODUCT_PACKAGES += tcmiface
#PRODUCT_BOOT_JARS += tcmiface

#GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config # gps/location secuity configuration file

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

#Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

#Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

 
# Media Codecs (Enable Codecs 2.0)
PRODUCT_PACKAGES += \
    libmedia_codecserviceregistrant \
    libqcodec2 \
    libstagefright_ccodec \
    vendor.qti.media.c2@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_sw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sw.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_telephony.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
#    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
#Enabling video for live effects
#-include frameworks/base/data/videos/VideoPackage1.mk #Missing qti_whitelist

# VNDK-SP:
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_PACKAGES += \
    vndk-sp
#vndk_package

# whitelisted app
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml


# For config.fs
TARGET_FS_CONFIG_GEN := $(LOCAL_PATH)/configs/config.fs


PRODUCT_PACKAGES += \
       liboemaids_system \
       liboemaids_vendor \
       android.hardware.health@2.0-service

# framework detect libs
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Wlan
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service
    
PRODUCT_PACKAGES += \
    sdm710_wlan.ko \
    wpa_cli \
    wifilearner

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/wlan/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/wlan/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/wlan/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/wlan/qca_cld3_wlan.ko:vendor/lib/modules/qca_cld3_wlan.ko

# Inherit from proprietary version
$(call inherit-product-if-exists, vendor/realme/RMX1921/RMX1921-vendor.mk)
