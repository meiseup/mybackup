LOCAL_PATH	:=	$(call my-dir)
#LOCAL_MODULE_SUFFIX		:=	$(TARGET_SHLIB_SUFFIX)
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS	:=	optional
LOCAL_SRC_FILES := test.c
LOCAL_MODULE := libtest
#LOCAL_PACKAGE_NAME	:=	Test
#LOCAL_MODULE_SUFFIX		:=	$(COMMON_ANDROID_SUFFIX)
LOCAL_SHARED_LIBRARIES := libc

include $(BUILD_SHARED_LIBRARY)

