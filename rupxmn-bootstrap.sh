#!/bin/bash
echo Stopping the Rupaya daemon
rupaya-cli stop
sleep 10s
echo Deleting the old files and folders from the ~/.rupayacore directory, and saving the rupaya.conf file.
cp ~/.rupayacore/rupaya.conf .
wait
sudo rm -rf ~/.rupayacore
wait
mkdir ~/.rupayacore
wait
mv rupaya.conf ~/.rupayacore/.
wait
echo Downloading the new bootstrap folders and files, this will take 1-2 minutes.
wait
wget https://rupaya.ams3.cdn.digitaloceanspaces.com/bootstrap/rupx-bootstrap.tar.gz  >/dev/null 2>&1
wait
echo Download complete
wait
echo Unzipping the bootstrap folders and files into the ~/.rupayacore directory, this should only take 1 minute.
echo If prompted, type A to replace the files.
wait
tar xf rupx-bootstrap.tar.gz -C ~/
wait
echo Updating permissions && sleep 10
sudo chown -R rupxmn:rupxmn ~/.rupayacore/
echo Starting the Rupaya Daemon
rupayad -daemon
echo The bootstrap installation complete and the Rupaya daemon should be running!
echo To confirm that the bootstrap worked, run the command: rupaya-cli getinfo
sudo rm rupx-bootstrap.tar.gz
sudo rm rupxmn-bootstrap.sh
exit
