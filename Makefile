# rootfs
RFSV8=./scripts/aarch64
ROOTFSV8=sudo ./scripts/aarch64
RFSV7=./scripts/armhf
ROOTFSV7=sudo ./scripts/armhf
RFSV6=./scripts/armel
ROOTFSV6=sudo ./scripts/armel
RFS2=./scripts/stage2

# clean
CLN=./scripts/clean
CLEAN=sudo ./scripts/clean


help:
	@echo
	@echo "Create a debian rootfs tarball"
	@echo
	@echo "Usage: "
	@echo
	@echo "  make install-depends   Install all dependencies"
	@echo "  make aarch64           Create aarch64 root filesystem"
	@echo "  make armhf             Create aarch64 root filesystem"
	@echo "  make armel             Create armel root filesystem"
	@echo "  make cleanup           Clean up image errors"
	@echo
	@echo "For details consult the README.md"
	@echo

# depends
install-depends:
	# Install all dependencies:
	sudo apt install build-essential bison bc git dialog patch \
	dosfstools zip unzip qemu debootstrap qemu-user-static rsync \
	parted fakeroot

# rootfs
aarch64:
	# ARM64 DEBIAN ROOTFS
	@chmod +x ${RFSV8}
	@chmod +x ${RFS2}
	@${ROOTFSV8}

armhf:
	# ARMv7 DEBIAN ROOTFS
	@chmod +x ${RFSV7}
	@chmod +x ${RFS2}
	@${ROOTFSV7}

armel:
	# ARMv6 DEBIAN ROOTFS
	@chmod +x ${RFSV6}
	@chmod +x ${RFS2}
	@${ROOTFSV6}

# clean and purge
cleanup:
	# Cleaning up
	@chmod +x ${CLN}
	@${CLEAN}
