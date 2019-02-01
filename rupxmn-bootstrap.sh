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
wget https://www.dropbox.com/s/hqmmf5wo6gpbq1b/rupx-bootstrap-160119.zip  >/dev/null 2>&1
wait
echo Download complete
wait
echo Installing Unzip
sudo apt-get install unzip -y  >/dev/null 2>&1
wait
echo Unzipping the bootstrap folders and files into the ~/.rupayacore directory, this should only take 1 minute.
echo If prompted, type A to replace the files.
wait
sudo unzip rupx-bootstrap-160119.zip -d ~/.rupayacore/ && sleep 10
wait
echo Changing the bootstrap folder ownership to rupxmn
sudo chown -R rupxmn:rupxmn ~/.rupayacore/
sudo rm rupx-bootstrap-160119.zip
wait
echo Starting the Rupaya Daemon
rupayad -daemon
echo The bootstrap installation complete and the Rupaya daemon should be running!
echo To confirm that the bootstrap worked, run the command: rupaya-cli getinfo
exit
