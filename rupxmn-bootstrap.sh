#!/bin/bash
echo stopping the Rupaya daemon
rupaya-cli stop
wait
echo deleting the old files and folders from the ~/.rupayacore directory
cp ~/.rupayacore/rupaya.conf .
rm -rf ~/.rupayacore
mkdir ~/.rupayacore
mv rupaya.conf ~/.rupayacore/.
wait
echo downloading the new bootstrap folders and files, this will take 1-2 minutes.
wget https://www.dropbox.com/s/hqmmf5wo6gpbq1b/rupx-bootstrap-160119.zip
echo download complete
wait
echo installing Unzip
sudo apt-get install unzip -y  >/dev/null 2>&1
wait
echo unzipping the bootstrap folders and files into the ~/.rupayacore directory
sudo unzip rupx-bootstrap-160119.zip -d ~/.rupayacore/
sudo chown -R rupxmn:rupxmn ~/.rupayacore/
sudo rm rupx-bootstrap-160119.zip
echo Starting the Rupaya Daemon
rupayad -daemon
echo bootstrap installation complete!
exit
