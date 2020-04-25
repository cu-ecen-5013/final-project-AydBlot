LCD_DRIVER_VERSION = 7ddc47978dc650a16840da56f5eec35c0f2f0a9f
LCD_DRIVER_SITE = git@github.com:cu-ecen-5013/final-project-ssssNick.git
LCD_DRIVER_SITE_METHOD = git

$(eval $(kernel-module))

define LCD_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LCD_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/lcd-util/aesd_lcd_util $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/lcd-test/lcd_test $(TARGET_DIR)/usr/bin
endef

LCD_DRIVER_MODULE_SUBDIRS = /lcd-driver

$(eval $(generic-package))
