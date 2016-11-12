#!/bin/bash
# clean up

# clean yum
yum -y clean all

# zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# ensure packer doesn't quit too early
sync
sync
sync
