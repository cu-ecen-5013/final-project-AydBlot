LCD_DRIVER_VERSION =
LCD_DRIVER_SITE = 
LCD_DRIVER_SITE_METHOD = git

$(eval $(kernel-module))

define LCD_DRIVER_BUILD_CMDS
endef

define LCD_DRIVER_INSTALL_TARGET_CMDS

endef

LCD_DRIVER_MODULE_SUBDIRS = 

$(eval $(generic-package))
