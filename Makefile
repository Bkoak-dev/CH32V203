# @file        Makefile
# @brief       The outermost Makefile
# @details     The root Makefile to compile the project
# @author      wangjingfan726@gmail.com
# @date        2023-12-19
# @version     v0.0.1

ifneq ($(wildcard .config),)
        -include .config
else
        $(warning oh dear, please make defconfig first.)
endif

KCONFIG_DIR  := $(PWD)/tools/kconfig

###############################################################################################
.phony: help menuconfig clean

help:
	@echo make [OPTIONS]
	@echo '  menuconfig      - Create autoconf.h .config according to Kconfig'
	@echo '  clean           - Clear compilation intermediate files'
	@echo 'Execute "make" or "make all" to build all targets marked with [*] '
	@echo 'For further info see the README.md file'

menuconfig:
	@$(MAKE) -C $(KCONFIG_DIR)
	@$(KCONFIG_DIR)/mconf Kconfig
	@$(KCONFIG_DIR)/conf -s --silentoldconfig Kconfig

clean:
	$(MAKE) -C $(KCONFIG_DIR) clean
	rm -rf .config ..config.tmp
