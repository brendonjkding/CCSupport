export XCODE_12_SLICE ?= 0

ifdef SIMULATOR
export TARGET = simulator:clang:latest:11.0
else
export TARGET = iphone:clang:13.0:11.0

ifeq ($(XCODE_12_SLICE), 1)
	export ARCHS = arm64e
else
	export ARCHS = arm64 arm64e
	export PREFIX = $(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/
endif
endif

export ROOTLESS ?= 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCSupport
CCSupport_CFLAGS = -fobjc-arc
ifeq ($(ROOTLESS), 1)
	CCSupport_CFLAGS += -fobjc-arc -D ROOTLESS=1
endif
CCSupport_FILES = Tweak.xm
CCSupport_PRIVATE_FRAMEWORKS = MobileIcons Preferences

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/aggregate.mk

setup::
	@sudo mkdir -p /var/mobile/Library/ControlCenter
	@sudo chmod -R 777 /var/mobile