LCD_DRIVER_VERSION = fc4e62e6850e9c76277c856be8f52b4625a4d6c8
LCD_DRIVER_SITE = git@github.com:cu-ecen-5013/final-project-ssssNick.git
LCD_DRIVER_SITE_METHOD = git

$(eval $(kernel-module))

define LCD_DRIVER_BUILD_CMDS

endef

define LCD_DRIVER_INSTALL_TARGET_CMDS

endef

LCD_DRIVER_MODULE_SUBDIRS = /lcd-driver

$(eval $(generic-package))
