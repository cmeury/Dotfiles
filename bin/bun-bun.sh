#/bin/bash -e
echo "Mounting \\\\bun-bun\\Media at /media ..."
sudo mount -t cifs	-o credentials=/home/ced/credentials/bun-bun,x-systemd.automount,uid=ced,gid=ced	//bun-bun/Media	/media
