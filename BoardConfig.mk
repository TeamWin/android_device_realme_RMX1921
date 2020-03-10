PRODUCT_NAME := Realme XT
PRODUCT_DEVICE := RMX1921
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX1921
PRODUCT_MANUFACTURER := realme
DEVICE_PATH := device/realme/RMX1921
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300
#TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

TARGET_USES_64_BIT_BINDER := true
SMALLER_FONT_FOOTPRINT := true
MINIMAL_FONT_FOOTPRINT := true

# Platform
BOARD_VENDOR := realme
TARGET_BOARD_PLATFORM := sdm710
TARGET_BOOTLOADER_BOARD_NAME := sdm710
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
BOARD_FRP_PARTITION_NAME := frp

## Flash
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# AVB 2.0
PRODUCT_SUPPORTS_VERITY := true
TARGET_MOUNT_POINTS_SYMLINKS := false
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2
$(call inherit-product, build/make/target/product/gsi_keys.mk) # Include GSI keys into first-stage ramdisk, so we can enable verified boot when booting a GSI.

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# Boot
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000

#Cache
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_APPEND_DTB := false
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000

# Persist
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
TARGET_NO_RECOVERY := true #Necessary for A/B
BOARD_USES_RECOVERY_AS_BOOT := true #Necessary for A/B
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery_AB_variant.fstab
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_msm #Enable compilation of oem-extensions to recovery

# System
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true # Should be "false" for dynamic partitions

# Userdata
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Vendor
TARGET_COPY_OUT_VENDOR := vendor
ENABLE_VENDOR_IMAGE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Kernel
TARGET_KERNEL_VERSION := 4.9
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := false
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 swiotlb=1 loop.max_part=7
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
TARGET_COMPILE_WITH_MSM_KERNEL := true
KERNEL_LLVM_SUPPORT := true
KERNEL_SD_LLVM_SUPPORT := true
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules
BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/qca_cld3_wlan.ko \
    $(KERNEL_MODULES_OUT)/audio_apr.ko \
    $(KERNEL_MODULES_OUT)/audio_wglink.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_pdr.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_notifier.ko \
    $(KERNEL_MODULES_OUT)/audio_adsp_loader.ko \
    $(KERNEL_MODULES_OUT)/audio_q6.ko \
    $(KERNEL_MODULES_OUT)/audio_usf.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_wcd.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_lpi.ko \
    $(KERNEL_MODULES_OUT)/audio_swr.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd_core.ko \
    $(KERNEL_MODULES_OUT)/audio_swr_ctrl.ko \
    $(KERNEL_MODULES_OUT)/audio_wsa881x.ko \
    $(KERNEL_MODULES_OUT)/audio_platform.ko \
    $(KERNEL_MODULES_OUT)/audio_cpe_lsm.ko \
    $(KERNEL_MODULES_OUT)/audio_hdmi.ko \
    $(KERNEL_MODULES_OUT)/audio_stub.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd9xxx.ko \
    $(KERNEL_MODULES_OUT)/audio_mbhc.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd_spi.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd_cpe.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd9335.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd934x.ko \
    $(KERNEL_MODULES_OUT)/audio_digital_cdc.ko \
    $(KERNEL_MODULES_OUT)/audio_analog_cdc.ko \
    $(KERNEL_MODULES_OUT)/audio_msm_sdw.ko \
    $(KERNEL_MODULES_OUT)/audio_native.ko \
    $(KERNEL_MODULES_OUT)/audio_machine_sdm710.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/mpq-adapter.ko \
    $(KERNEL_MODULES_OUT)/mpq-dmx-hw-plugin.ko

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

#Audio
BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_GENERIC_AUDIO := true
TARGET_USES_AOSP_FOR_AUDIO := false
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_SUPPORTS_QAHW := false
BOARD_SUPPORTS_QSTHW_API := true
BOARD_SUPPORTS_SOUND_TRIGGER_ARM := false
BOARD_SUPPORTS_SOUND_TRIGGER_CPU_AFFINITY_SET := false
BOARD_SUPPORTS_FFV_EC_THREAD_RT_PRIORITY := false
USE_XML_AUDIO_POLICY_CONF := 1
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true

#Audio Features
AUDIO_FEATURE_ENABLED_HIFI_AUDIO := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
AUDIO_FEATURE_ENABLED_KEEP_ALIVE := false
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_RAS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_FFV := false
AUDIO_FEATURE_ENABLED_KEEP_ALIVE_ARM_FFV := false
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)
BOARD_HAVE_BLUETOOTH := true # Some framework code requires this to enable BT
BOARD_USES_WIPOWER := true # Some framework code requires this to enable BT
TARGET_USE_QTI_BT_STACK := true

# Camera
USE_CAMERA_STUB := true
TARGET_USES_QTI_CAMERA2CLIENT := true #Enable QTI specific Camera2Client layer
TARGET_USE_VENDOR_CAMERA_EXT := true

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888 #Enable Charging Icon

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DRM_PP := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true #Enable Wide color gamut support
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# dm-verity definitions
PRODUCT_SYSTEM_VERITY_PARTITION=/dev/block/bootdevice/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION=/dev/block/bootdevice/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

# Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# EGL implementation
BOARD_EGL_CFG := device/realme/RMX1921/egl.cfg
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
PRODUCT_PACKAGES += libGLES_android
-include $(QCPATH)/common/config/qtic-config.mk
PRODUCT_BOOT_JARS += tcmiface
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
PRODUCT_PROPERTY_OVERRIDES  += \
    ro.opengles.version=196610 #version 3.2
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_HW_DISK_ENCRYPTION_PERF := true
BOARD_SECCOMP_POLICY := device/qcom/$(TARGET_BOARD_PLATFORM)/seccomp
TARGET_NO_BOOTLOADER := false
TARGET_USES_UEFI := true
TARGET_NO_KERNEL := false
BOARD_PRESIL_BUILD := true
-include vendor/qcom/prebuilt/sdm710/BoardConfigVendor.mk
-include $(QCPATH)/common/sdm710/BoardConfigVendor.mk

TARGET_USES_NEW_ION := false #Enable it only on kernel versions >4.14
TARGET_USES_ION := true
#TARGET_USES_NEW_ION_API :=true

TARGET_INIT_VENDOR_LIB := libinit_msm

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
TARGET_NO_RPC := true

# Graphics
BUILD_EMULATOR_OPENGL := true
USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true

#FM
BOARD_HAVE_QCOM_FM := true
TARGET_USE_QTI_BT_CONFIGSTORE := true
TARGET_USE_QTI_BT_SAR := true
TARGET_USE_QTI_VND_FWK_DETECT := true

# Sensors
USE_SENSOR_MULTI_HAL := true
USE_SENSOR_HAL_VER := 2.0

#VNDK
BOARD_VNDK_VERSION:= current
PRODUCT_PACKAGES += vndk_package
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE:=true
TARGET_USES_MKE2FS := true

#WLAN
WLAN_CHIPSET := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/qca_cld3_wlan.ko
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_HIDL_FEATURE_AWARE := true # Enable WIFI AWARE FEATURE
TARGET_USES_AOSP_FOR_WLAN := false # WLAN specific aosp flag
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true # Enable STA + SAP Concurrency.
QC_WIFI_HIDL_FEATURE_DUAL_AP := true # Enable SAP + SAP Feature.

# Optimisations
WITH_DEXPREOPT_PIC := true # Enable dex pre-opt to speed up initial boot

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

TARGET_USES_QCOM_BSP_ATEL := true
ifeq ($(TARGET_USES_QCOM_BSP_ATEL),true)
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
endif
