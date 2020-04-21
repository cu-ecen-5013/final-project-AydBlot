LCD_DRIVER_VERSION = ead1311831418d9ca1d754009167c39d83c5375b
LCD_DRIVER_SITE = git@github.com:cu-ecen-5013/final-project-ssssNick.git
LCD_DRIVER_SITE_METHOD = git

$(eval $(kernel-module))

define LCD_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LCD_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/lcd-util/aesd_lcd_util $(TARGET_DIR)/usr/bin
endef

LCD_DRIVER_MODULE_SUBDIRS = /lcd-driver

$(eval $(generic-package))
