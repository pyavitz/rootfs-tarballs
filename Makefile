# debian buster
RFSV8=./scripts/aarch64
ROOTFSV8=sudo ./scripts/aarch64
RFSV7=./scripts/armhf
ROOTFSV7=sudo ./scripts/armhf
RFSV6=./scripts/armel
ROOTFSV6=sudo ./scripts/armel
RFS2=./scripts/stage2

# devuan beowulf
DEVRFSV8=./scripts/devuan-aarch64
DEVROOTFSV8=sudo ./scripts/devuan-aarch64
DEVRFSV6=./scripts/devuan-armel
DEVROOTFSV6=sudo ./scripts/devuan-armel
DEVRFS2=./scripts/devuan-stage2

# ubuntu 20.04
UB1=./scripts/ubuntu
UB=sudo ./scripts/ubuntu
UB2=./scripts/ubuntu-stage2

# clean
CLN=./scripts/clean
CLEAN=sudo ./scripts/clean


help:
	@echo
	@echo "These scripts create and respin rootfs tarballs"
	@echo "To later be used with the Raspberry Pi Image Builder"
	@echo
	@echo "Usage: Debian Devuan Ubuntu"
	@echo
	@echo "  make install-depends   Install all dependencies"
	@echo "  make aarch64           Create aarch64 root filesystem"
	@echo "  make armhf             Create aarch64 root filesystem"
	@echo "  make armel             Create armel root filesystem"
	@echo "  make dev-aarch64       Respin Devuan aarch64 filesystem"
	@echo "  make dev-armel         Respin Devuan armel filesystem"
	@echo "  make ubuntu            Respin Ubuntu aarch64 filesystem"
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

dev-aarch64:
	# ARM64 DEVUAN ROOTFS
	@chmod +x ${DEVRFSV8}
	@chmod +x ${DEVRFS2}
	@${DEVROOTFSV8}

dev-armel:
	# ARMv6 DEVUAN ROOTFS
	@chmod +x ${DEVRFSV6}
	@chmod +x ${DEVRFS2}
	@${DEVROOTFSV6}

ubuntu:
	# ARM64 UBUNTU ROOTFS
	@chmod +x ${UB1}
	@chmod +x ${UB2}
	@${UB}

# clean and purge
cleanup:
	# Cleaning up
	@chmod +x ${CLN}
	@${CLEAN}
