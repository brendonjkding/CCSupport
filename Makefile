ifdef SIMULATOR
export TARGET = simulator:clang:latest:11.0
else
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET := iphone:clang:16.5:15.0
else
TARGET := iphone:clang:14.5:11.0
endif
endif

INSTALL_TARGET_PROCESSES = SpringBoard Preferences

TWEAK_NAME = CCSupport
CCSupport_CFLAGS = -fobjc-arc
CCSupport_FILES = $(wildcard *.xm *.m)
CCSupport_PRIVATE_FRAMEWORKS = MobileIcons Preferences

ifneq ($(THEOS_PACKAGE_SCHEME),rootless)
CCSupport_CFLAGS += -D XINA_SUPPORT=1
endif

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += HomeProvider
include $(THEOS_MAKE_PATH)/aggregate.mk

setup::
	@sudo mkdir -p /var/mobile/Library/ControlCenter
	@sudo chmod -R 777 /var/mobile
