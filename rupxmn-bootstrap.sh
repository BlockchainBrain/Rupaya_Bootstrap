#!/bin/bash
echo stopping the Rupaya daemon
rupaya-cli stop
wait
echo deleting the old files and folders from the ~/.rupayacore directory, and saving the rupaya.conf file.
wait
sudo cp ~/.rupayacore/rupaya.conf .
wait
sudo rm -rf ~/.rupayacore
wait
sudo mkdir ~/.rupayacore
sudo mv rupaya.conf ~/.rupayacore/.
wait
echo downloading the new bootstrap folders and files, this will take 1-2 minutes.
wget https://www.dropbox.com/s/hqmmf5wo6gpbq1b/rupx-bootstrap-160119.zip  >/dev/null 2>&1
wait
echo download complete
wait
echo installing Unzip
sudo apt-get install unzip -y  >/dev/null 2>&1
wait
echo unzipping the bootstrap folders and files into the ~/.rupayacore directory, this should only take 1 minute.
echo if prompted, type A to replace the files.
wait
sudo unzip rupx-bootstrap-160119.zip -d ~/.rupayacore/
wait
sudo chown -R rupxmn:rupxmn ~/.rupayacore/
sudo rm rupx-bootstrap-160119.zip
wait
echo Starting the Rupaya Daemon
rupayad -daemon
echo The bootstrap installation complete and the Rupaya daemon should be running!
exit
