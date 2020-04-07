#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = a012a2f66439da4412987deefa1c2b6f074ed106 
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/assignment-3-manual-kernel-and-root-filesystem-build-AydBlot.git
AESD_ASSIGNMENTS_SITE_METHOD = git

$(eval $(kernel-module))

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket

endef

AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

$(eval $(generic-package))
