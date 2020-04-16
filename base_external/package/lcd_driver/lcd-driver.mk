LCD_DRIVER_VERSION = d1f980c84412b1524cc4704e5bbaecda88c861aa
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
