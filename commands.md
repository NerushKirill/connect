## Expand disk

```bash
# Check disk space usage for the root (/) filesystem
df -h /.
# Determine the filesystem type for the specified devices /dev/sda*
sudo file -s /dev/sda*
# List block devices
lsblk
# Increase root volume partition
sudo growpart /dev/sda 3
# Extend the volume group "ubuntu--vg" to include the enlarged partition
sudo vgextend ubuntu--vg /dev/sda3
# Resize the physical volume on the extended partition
sudo pvresize /dev/sda3
# Extend the size of the logical volume by 10 gigabytes
sudo lvextend -L +10G /dev/ubuntu-vg/ubuntu-lv
# Resize the filesystem on the logical volume to utilize the new space
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
# Display information about physical volumes
sudo pvdisplay
# Display information about logical volumes
sudo lvdisplay
```
