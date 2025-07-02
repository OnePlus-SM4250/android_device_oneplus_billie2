#
# Copyright (C) 2018-2024 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),billie2)
include $(call all-makefiles-under,$(LOCAL_PATH))

WIFI_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware
$(WIFI_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating wifi firmware symlinks: $@"
	@mkdir -p $@/wlan/qca_cld
	$(hide) ln -sf /mnt/vendor/persist/wlan_mac.bin $@/wlan/qca_cld/wlan_mac.bin
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@/wlan/qca_cld/WCNSS_qcom_cfg.ini

WIFI_FIRMWARE_QCA6390_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld
$(WIFI_FIRMWARE_QCA6390_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating wifi firmware symlinks: $@"
	mkdir -p $@/qca6390
	$(hide) ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $@/qca6390/wlan_mac.bin
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@/qca6390/WCNSS_qcom_cfg.ini

ALL_DEFAULT_INSTALLED_MODULES += \
    $(WIFI_FIRMWARE_SYMLINKS) \
	$(WIFI_FIRMWARE_QCA6390_SYMLINKS)

endif
