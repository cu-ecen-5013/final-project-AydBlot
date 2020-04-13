LCD_DRIVER_VERSION = 2a217a6ff0162ba335ec91da0f57f14b00e55713
LCD_DRIVER_SITE = git@github.com:cu-ecen-5013/final-project-ssssNick.git
LCD_DRIVER_SITE_METHOD = git

$(eval $(kernel-module))

define LCD_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LCD_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd_lcd_util $(TARGET_DIR)/usr/bin
endef

LCD_DRIVER_MODULE_SUBDIRS = /lcd-driver

$(eval $(generic-package))
