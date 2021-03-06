ARCHS = armv7 armv7s arm64
TARGET = iphone:latest:7.0
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = KeyShortcut
KeyShortcut_FILES = KeyShortcut.x
KeyShortcut_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

THEOS_PACKAGE_BASE_VERSION = 3.0
_THEOS_INTERNAL_PACKAGE_VERSION = 3.0

after-install::
	install.exec "killall -9 SpringBoard"

release::
	dpkg-deb -b $(THEOS_STAGING_DIR) "$(THEOS_BUILD_DIR)/$(THEOS_PACKAGE_NAME)_$(THEOS_PACKAGE_BASE_VERSION)$(if $(PACKAGE_BUILDNAME),"+"$(PACKAGE_BUILDNAME))_$(THEOS_PACKAGE_ARCH).deb"
