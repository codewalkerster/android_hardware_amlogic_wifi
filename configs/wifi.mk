#
# Copyright (C) 2012 The Android Open Source Project
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
#

PRODUCT_PACKAGES += wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml
PRODUCT_PROPERTY_OVERRIDES += \
	ro.carrier=wifi-only

PRODUCT_PACKAGES += \
    wificond \
    wifilogd \
    libwifi-hal-common-ext

################################################################################## multiwifi
ifeq ($(WIFI_MODULE), multiwifi)

MULTI_WIFI_SUPPORT := true
WIFI_DRIVER_MODULE_PATH := /vendor/lib/modules/
WIFI_DRIVER_MODULE_NAME := dhd
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION			:= VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_multi
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_multi
BOARD_HOSTAPD_DRIVER				:= NL80211

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml
PRODUCT_PROPERTY_OVERRIDES += \
        wifi.interface=wlan0 \
	wifi.direct.interface=p2p0

PRODUCT_COPY_FILES += hardware/amlogic/wifi/configs/init_rc/init.amlogic.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroid.wifi.rc
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/bcm_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/bcm_supplicant.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/bcm_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/bcm_supplicant_overlay.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/multi_wifi/config/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf
PRODUCT_COPY_FILES += hardware/amlogic/wifi/bcm_ampak/config/AP6256/Wi-Fi/fw_bcm43456c5_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/6255/fw_bcm43456c5_ag.bin
PRODUCT_COPY_FILES += hardware/amlogic/wifi/bcm_ampak/config/AP6256/Wi-Fi/fw_bcm43456c5_ag_apsta.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/6255/fw_bcm43456c5_ag_apsta.bin
PRODUCT_COPY_FILES += hardware/amlogic/wifi/bcm_ampak/config/AP6256/Wi-Fi/nvram_ap6256.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/6255/nvram_ap6256.txt
endif
