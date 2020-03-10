DEVICE_PATH := device/realme/RMX1921
PRODUCT_PACKAGES += $(PRODUCT_PACKAGES_DEBUG)

#Initial bringup flags
TARGET_USES_AOSP := false
TARGET_USES_AOSP_FOR_AUDIO := false
TARGET_USES_QCOM_BSP := false

#Realme XT is a product launcher with p
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)
SHIPPING_API_LEVEL := 28 #The version is 29 only for devices launched with Q
BOARD_DYNAMIC_PARTITION_ENABLE := false #Enabled only for products launched with Q. They contain a new metadata partition as well as Super partition
PRODUCT_USE_DYNAMIC_PARTITIONS := false #Enabled only for products launched with Q. They contain a new metadata partition as well as Super partition
#PRODUCT_PACKAGES += fastbootd

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-RMX1921
PRODUCT_COPY_FILES += $(DEVICE_PATH)/fstab_AB_variant.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom
# For QSSI builds, we skip building the system image. Instead we build the
# "non-system" images (that we support).
PRODUCT_BUILD_SYSTEM_IMAGE := false
PRODUCT_BUILD_SYSTEM_OTHER_IMAGE := false
PRODUCT_BUILD_VENDOR_IMAGE := true
PRODUCT_BUILD_PRODUCT_IMAGE := false
PRODUCT_BUILD_PRODUCT_SERVICES_IMAGE := false
PRODUCT_BUILD_ODM_IMAGE := false
PRODUCT_BUILD_CACHE_IMAGE := false
PRODUCT_BUILD_RAMDISK_IMAGE := true
PRODUCT_BUILD_USERDATA_IMAGE := true
# Also, since we're going to skip building the system image, we also skip
# building the OTA package. We'll build this at a later step. We also don't
# need to build the OTA tools package (we'll use the one from system build).
TARGET_SKIP_OTA_PACKAGE := true
TARGET_SKIP_OTATOOLS_PACKAGE := true

# Enable A/B System
ENABLE_AB := true
BOARD_DYNAMIC_PARTITION_ENABLE := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
      boot \
      vendor \
      system

PRODUCT_PACKAGES += \
  update_engine \
  update_engine_client \
  update_verifier \
  android.hardware.boot@1.0-impl \
  android.hardware.boot@1.0-service \
  brillo_update_payload


#AMPLOADER
PRODUCT_PACKAGES += amploader

#APPS
PRODUCT_PACKAGES += \
    QualcommSoftAP \
    TSCalibration

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

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee

#Boot control HAL test app
PRODUCT_PACKAGES_DEBUG += bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
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
    android.hardware.audio@4.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@4.0-impl

# enable audio hidl hal 5.0
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@5.0-impl

PRODUCT_PACKAGES += \
    VoicePrintTest \
    VoicePrintDemo

PRODUCT_PACKAGES += \
    AudioSettings

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.sdm710

PRODUCT_PACKAGES += \
   snd_soc_msm_Taiko \
   snd_soc_msm_Taiko_CDP \
   snd_soc_msm_Taiko_liquid

PRODUCT_PACKAGES += \
   fs_config_files \
   android.hardware.media.omx@1.0-impl

-include $(LOCAL_PATH)/media/sdm710.mk

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
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_policy.conf:vendor/etc/audio_policy.conf \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuw.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/mixer_paths_360cam.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_360cam.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_i2s.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_platform_info_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skuw.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_skuw.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += \
    $(TOPDIR)vendor/qcom/opensource/audio-hal/primary-hal/configs/common/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(TOPDIR)vendor/qcom/opensource/audio-hal/primary-hal/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml

#Listen configuration file
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/sdm710/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

##Ambisonic Capture
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.ambisonic.capture=false \
persist.vendor.audio.ambisonic.auto.profile=false

##fluencetype can be "fluence" or "fluencepro" or "none"
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sdk.fluencetype=none\
persist.vendor.audio.fluence.voicecall=true\
persist.vendor.audio.fluence.voicerec=false\
persist.vendor.audio.fluence.speaker=true\
persist.vendor.audio.fluence.audiorec=false\
persist.vendor.audio.fluence.tmic.enabled=false
ro.qc.sdk.audio.fluencetype=none\
persist.audio.fluence.voicecall=true\
persist.audio.fluence.voicerec=false\
persist.audio.fluence.speaker=true

# Mutlirec Apptype
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.apptype.multirec.enabled=false \
    vendor.audio.record.multiple.enabled=false

##speaker protection v3 switch and ADSP AFE API version
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.spv3.enable=true\
persist.vendor.audio.avs.afe_api_version=2

#disable tunnel encoding
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.tunnel.encode=false

#Disable RAS Feature by default
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.ras.enabled=false

#Buffer size in kbytes for compress offload playback
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.buffer.size.kb=64

#Minimum duration for offload playback in secs
PRODUCT_PROPERTY_OVERRIDES += \
audio.offload.min.duration.secs=30

#Enable offload audio video playback by default
PRODUCT_PROPERTY_OVERRIDES += \
audio.offload.video=true

#Enable audio track offload by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.track.enable=true

#Enable music through deep buffer
PRODUCT_PROPERTY_OVERRIDES += \
audio.deep_buffer.media=true

#enable voice path for PCM VoIP by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.voice.path.for.pcm.voip=true

#Enable multi channel aac through offload
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.multiaac.enable=true

#Enable DS2, Hardbypass feature for Dolby
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.dolby.ds2.enabled=false \
vendor.audio.dolby.ds2.hardbypass=false

#Disable Multiple offload sesison
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.multiple.enabled=false

#Disable Compress passthrough playback
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.passthrough=false

#Disable surround sound recording
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sdk.ssr=false

#enable dsp gapless mode by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.gapless.enabled=true

#enable pbe effects
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.safx.pbe.enabled=false

#parser input buffer size(256kb) in byte stream mode
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.parser.ip.buffer.size=262144

#flac sw decoder 24 bit decode capability
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.flac.sw.decoder.24bit=true

#split a2dp DSP supported encoder list
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxhd-aac-ldac

# A2DP offload support
PRODUCT_PROPERTY_OVERRIDES += \
ro.bluetooth.a2dp_offload.supported=true

# Disable A2DP offload
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.disabled=false

# A2DP offload DSP supported encoder list
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac

#enable software decoders for ALAC and APE
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.use.sw.alac.decoder=true
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.use.sw.ape.decoder=true

#enable hw aac encoder by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.hw.aac.encoder=true

#audio becoming noisy intent broadcast delay
PRODUCT_PROPERTY_OVERRIDES += \
audio.sys.noisy.broadcast.delay=600

#offload pausetime out duration to 3 secs to inline with other outputs
PRODUCT_PROPERTY_OVERRIDES += \
audio.sys.offload.pstimeout.secs=3

#Enable HIFI audio support for internal codec
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.hifi.int_codec=true

#Set AudioFlinger client heap size
PRODUCT_PROPERTY_OVERRIDES += \
ro.af.client_heap_size_kbyte=7168

#keep alive is needed by default for ffv
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.keep_alive.disabled=false

#enable headset calibration
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.volume.headset.gain.depcal=true

#enable dualmic fluence for voice communication
PRODUCT_PROPERTY_OVERRIDES += \
persist.audio.fluence.voicecomm=true

#enable AAC frame ctl for A2DP sinks
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.bt.aac_frm_ctl.enabled=true

#add dynamic feature flags here
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.feature.a2dp_offload.enable=true \
vendor.audio.feature.afe_proxy.enable=true \
vendor.audio.feature.anc_headset.enable=true \
vendor.audio.feature.battery_listener.enable=false \
vendor.audio.feature.compr_cap.enable=false \
vendor.audio.feature.compress_in.enable=false \
vendor.audio.feature.compress_meta_data.enable=true \
vendor.audio.feature.compr_voip.enable=false \
vendor.audio.feature.concurrent_capture.enable=false \
vendor.audio.feature.custom_stereo.enable=true \
vendor.audio.feature.display_port.enable=true \
vendor.audio.feature.dsm_feedback.enable=false \
vendor.audio.feature.dynamic_ecns.enable=false \
vendor.audio.feature.ext_hw_plugin.enable=false \
vendor.audio.feature.external_dsp.enable=false \
vendor.audio.feature.external_speaker.enable=false \
vendor.audio.feature.external_speaker_tfa.enable=false \
vendor.audio.feature.fluence.enable=true \
vendor.audio.feature.fm.enable=true \
vendor.audio.feature.hdmi_edid.enable=true \
vendor.audio.feature.hdmi_passthrough.enable=true \
vendor.audio.feature.hfp.enable=true \
vendor.audio.feature.hifi_audio.enable=true \
vendor.audio.feature.hwdep_cal.enable=false \
vendor.audio.feature.incall_music.enable=false \
vendor.audio.feature.multi_voice_session.enable=true \
vendor.audio.feature.keep_alive.enable=false \
vendor.audio.feature.kpi_optimize.enable=true \
vendor.audio.feature.maxx_audio.enable=false \
vendor.audio.feature.ras.enable=true \
vendor.audio.feature.record_play_concurency.enable=false \
vendor.audio.feature.src_trkn.enable=true \
vendor.audio.feature.spkr_prot.enable=true \
vendor.audio.feature.ssrec.enable=true \
vendor.audio.feature.usb_offload.enable=true \
vendor.audio.feature.usb_offload_burst_mode.enable=false \
vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
vendor.audio.feature.deepbuffer_as_primary.enable=false \
vendor.audio.feature.vbat.enable=true \
vendor.audio.feature.wsa.enable=false \
vendor.audio.feature.audiozoom.enable=false \
vendor.audio.feature.snd_mon.enable=true


# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192

#snapdragon value add features
PRODUCT_PROPERTY_OVERRIDES += \
ro.qc.sdk.audio.ssr=false

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
    memtrack.default
    memtrack.sdm710 \
    libqdutils \
    libqdMetaData

PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    ro.vendor.display.cabl=2 \
    debug.sf.hw=0 \
    debug.egl.hw=0 \
    debug.sf.latch_unsignaled=1 \
    vendor.display.enable_default_color_mode=1

#Qdcm calibration xml file for 2k panel
PRODUCT_COPY_FILES += hardware/qcom/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml
#Qdcm calibration xml file for 2k video panel
PRODUCT_COPY_FILES += hardware/qcom/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Dual_nt35597_video_mode_dsi_truly_panel_without_DSC.xml

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

# MIDI
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += device/qcom/sdm710/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Powerhint configuration file
PRODUCT_COPY_FILES += device/qcom/sdm710/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

#MANIFEST/MATRIX 
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vendor_framework_compatibility_matrix.xml

# RRO configuration
TARGET_USES_RRO := true
DEVICE_PACKAGE_OVERLAYS += device/qcom/sdm710/overlay

# Add non-hlos files to ota packages
ADD_RADIO_FILES := true

# To use libhealthd.msm instead of libhealthd.default
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm

# privapp-permissions whitelisting
PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=enforce

# Enable DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true

# Enable binderized USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

#Add soft home, back and multitask keys
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0

#Property to enable IO cgroups
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.iocgrp.config=1

#Property for setting the max timeout of autosuspend
PRODUCT_PROPERTY_OVERRIDES += sys.autosuspend.timeout=500000

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
  dalvik.vm.heapgrowthlimit=256m
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/qcom/qssi/common64.mk)

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := sdcard

# Enable DuerOS for voiceUI
BOARD_VOICEUI_USE_DUEROS := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/qcom/opensource/audio-hal/primary-hal/configs/common/overlay


# Thermal
PRODUCT_PACKAGES += android.hardware.thermal@1.0-impl \
                    android.hardware.thermal@1.0-service \
                    thermal.sdm710
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

#FM
PRODUCT_PACKAGES += \
 qcom.fmradio \
 libqcomfm_jni \
 fm_helium \
 ftm_fm_lib \
 libfm-hci

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

PRODUCT_PACKAGES += \
  qti-telephony-hidl-wrapper \
  qti_telephony_hidl_wrapper.xml

PRODUCT_PACKAGES += \
  qti-telephony-utils \
  qti_telephony_utils.xml

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
PRODUCT_PACKAGES += libI420colorconvert

#INIT
PRODUCT_PACKAGES += \
 init.qcom.composition_type.sh \
 init.target.8x25.sh \
 init.qcom.mdm_links.sh \
 init.qcom.modem_links.sh \
 init.qcom.sensor.sh \
 init.target.rc \
 init.qti.ims.sh \
 init.qcom.coex.sh \
 init.qcom.early_boot.sh \
 init.qcom.post_boot.sh \
 init.qcom.syspart_fixup.sh \
 init.qcom.rc \
 init.recovery.qcom.rc \
 init.qcom.factory.rc \
 init.qcom.sdio.sh \
 init.qcom.sh \
 init.qcom.class_core.sh \
 init.class_main.sh \
 init.qcom.wifi.sh \
 vold.fstab \
 init.qcom.ril.path.sh \
 init.qcom.usb.rc \
 init.msm.usb.configfs.rc \
 init.qcom.usb.sh \
 usf_post_boot.sh \
 init.qcom.efs.sync.sh \
 ueventd.qcom.rc \
 qca6234-service.sh \
 ssr_setup \
 enable_swap.sh \
 init.mdm.sh \
 fstab.qcom \
 fstab.qti \
 init.qcom.sensors.sh \
 init.qcom.crashdata.sh \
 init.qcom.vendor.rc \
 init.target.vendor.rc \
 init.qti.fm.sh \
 init.qti.can.sh

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
PRODUCT_PACKAGES += $(KEYPAD)
KEYPAD := ffa-keypad_qwerty.kcm
KEYPAD += ffa-keypad_numeric.kcm
KEYPAD += fluid-keypad_qwerty.kcm
KEYPAD += fluid-keypad_numeric.kcm
KEYPAD += surf_keypad_qwerty.kcm
KEYPAD += surf_keypad_numeric.kcm
KEYPAD += surf_keypad.kcm
KEYPAD += 7k_ffa_keypad.kcm
KEYPAD += 7x27a_kp.kcm
KEYPAD += keypad_8960_qwerty.kcm
KEYPAD += 7k_ffa_keypad.kl
KEYPAD += 7k_handset.kl
KEYPAD += 7x27a_kp.kl
KEYPAD += 8660_handset.kl
KEYPAD += atmel_mxt_ts.kl
KEYPAD += synaptics_rmi4_i2c.kl
KEYPAD += synaptics_dsx.kl
KEYPAD += synaptics_dsxv26.kl
KEYPAD += cyttsp-i2c.kl
KEYPAD += ft5x06_ts.kl
KEYPAD += ffa-keypad.kl
KEYPAD += fluid-keypad.kl
KEYPAD += gpio-keys.kl
KEYPAD += qpnp_pon.kl
KEYPAD += keypad_8960.kl
KEYPAD += keypad_8960_liquid.kl
KEYPAD += synaptics_rmi4_i2c.kl
KEYPAD += msm_tma300_ts.kl
KEYPAD += philips_remote_ir.kl
KEYPAD += samsung_remote_ir.kl
KEYPAD += surf_keypad.kl
KEYPAD += ue_rf4ce_remote.kl

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
LIBAUDIOPARAM := libaudioparameter

#LIBAUDIORESAMPLER -- High-quality audio resampler
LIBAUDIORESAMPLER := libaudio-resampler

#LIBOPENCOREHW
LIBOPENCOREHW := libopencorehw

#LIBOVERLAY
LIBOVERLAY := liboverlay
LIBOVERLAY += overlay.default

#LIBGENLOCK
LIBGENLOCK := libgenlock

#LIBPERFLOCK
LIBPERFLOCK := org.codeaurora.Performance

#LIBQCOMUI
LIBQCOMUI := libQcomUI

#LIBQDUTILS
LIBQDUTILS := libqdutils

#LIBQDMETADATA
LIBQDMETADATA := libqdMetaData

#LIBPOWER
TARGET_USES_NON_LEGACY_POWERHAL := true
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
 libstagefright_soft_flacdec

#MM_CORE
PRODUCT_PACKAGES += \
 libmm-omxcore \
 libOmxCore

#WFD
PRODUCT_PACKAGES += \
 libwfdaac \
 libwfdaac_vendor


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
 libunz \
 minigzip

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
 rcs_service_api.xml \

#IMS SETTINGS
PRODUCT_PACKAGES += imssettings

#IMS Extension module for Android Telephony
PRODUCT_PACKAGES += \
 ims-ext-common \
 ims_ext_common.xml \
 ConfURIDialer

#CRDA
CRDA := \
 crda \
 regdbdump \
 regulatory.bin \
 linville.key.pub.pem \
 init.crda.sh

#WLAN
PRODUCT_PACKAGES += \
  prima_wlan.ko \
  pronto_wlan.ko \
  qca_cld_wlan.ko

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

DELAUN := Launcher3


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
PRODUCT_PACKAGES += librecovery_updater_msm

# vcard jar
PRODUCT_PACKAGES += vcard

# tcmiface for tcm support
PRODUCT_PACKAGES += tcmiface


PRODUCT_PACKAGES += libhealthd.msm # healthd libaray expanded for mode charger


PRODUCT_PACKAGES_DEBUG += init.qcom.testscripts.sh #intialise PRODUCT_PACKAGES_DEBUG list for debug modules

#Add init.qcom.test.rc to PRODUCT_PACKAGES_DEBUG list
PRODUCT_PACKAGES_DEBUG += \
        init.qcom.test.rc \
        init.qcom.debug.sh

#Camera
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\

#Telephony
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \

#GPS
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml
PRODUCT_COPY_FILES += \
    device/qcom/common/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config # gps/location secuity configuration file

#Touchscreen
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml 

#Wifi
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \

#Device
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

#Sensors
PRODUCT_COPY_FILES += \
    device/qcom/sdm710/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
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
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml

#USB
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \

#Bluetooth
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \

PRODUCT_PROPERTY_OVERRIDES += ro.hardware.keystore_desede=true # Enable TDES support when KM4 is enabled
        
#Media Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    device/qcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/qcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    device/qcom/common/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml

TARGET_NOT_SUPPORT_VULKAN := false
ifneq ($(TARGET_NOT_SUPPORT_VULKAN),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml
endif

# include additional build utilities
-include device/qcom/common/utils.mk

# Copy the vulkan feature level file.
# Targets listed in VULKAN_FEATURE_LEVEL_0_TARGETS_LIST supports only vulkan feature level 0.
ifneq ($(TARGET_NOT_SUPPORT_VULKAN),true)
ifeq ($(call is-product-in-list,$(VULKAN_FEATURE_LEVEL_0_TARGETS_LIST)), true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml
else
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml
endif
endif

ifneq ($(TARGET_NOT_SUPPORT_VULKAN),true)
ifeq ($(TARGET_SUPPORT_VULKAN_VERSION_1_1),false)
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml
else
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml
endif
endif


DEVICE_PACKAGE_OVERLAYS += device/qcom/common/device/overlay
PRODUCT_PACKAGE_OVERLAYS += device/qcom/common/product/overlay

#Enabling video for live effects
-include frameworks/base/data/videos/VideoPackage1.mk



# VNDK-SP:
PRODUCT_PACKAGES += \
    vndk-sp \

$(call inherit-product, device/qcom/common/base.mk)

# For PRODUCT_COPY_FILES, the first instance takes precedence.
# Since we want use QC specific files, we should inherit
# device-vendor.mk first to make sure QC specific files gets installed.
$(call inherit-product-if-exists, $(QCPATH)/common/config/device-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_AAPT_CONFIG += hdpi mdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.backup.ntpServer=0.pool.ntp.org \
    sys.vendor.shutdown.waittime=500 \
    persist.vendor.radio.procedure_bytes=SKIP

PRODUCT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/bootdevice/by-name/frp


# whitelisted app
PRODUCT_COPY_FILES += \
    device/qcom/common/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

PRODUCT_COPY_FILES += \
    device/qcom/common/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

#copy telephony app's permissions
PRODUCT_COPY_FILES += $(QCPATH)/commonsys-intf/telephony/build/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml

# Permission for Wi-Fi passpoint support
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

PRODUCT_PRIVATE_KEY := device/qcom/common/qcom.key

##end of common
# Temporary handling
#
# Include config.fs get only if legacy device/qcom/<target>/android_filesystem_config.h
# does not exist as they are mutually exclusive.  Once all target's android_filesystem_config.h
# have been removed, TARGET_FS_CONFIG_GEN should be made unconditional.

TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

PRODUCT_PROPERTY_OVERRIDES += \
        persist.vendor.qcomsysd.enabled=1

PRODUCT_PACKAGES_DEBUG += \
    init.qcom.debug.sh \
    init.qcom.debug-sdm710.sh

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
    $(WLAN_CHIPSET)_wlan.ko \
    wpa_cli \
    wifilearner

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
	$(DEVICE_PATH)/wlan/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	$(DEVICE_PATH)/wlan/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/wlan/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
        frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

