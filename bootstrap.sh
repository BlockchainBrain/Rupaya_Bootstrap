#!/bin/bash
echo stopping the Rupaya daemon
rupaya-cli stop
wait
echo deleting the old files and folders from the ~/.rupayacore directory
rm -rf ~/.rupayacore/backups ~/.rupayacore/blocks ~/.rupayacore/chainstate ~/.rupayacore/database ~/.rupayacore/sporks ~/.rupayacore/zerocoin >/dev/null 2>&1
rm ~/.rupayacore/*.log ~/.rupayacore/*.dat ~/.rupayacore/.lock ~/.rupayacore/rupayad.pid >/dev/null 2>&1
wait
echo downloading the new bootstrap folders and files
wget https://www.dropbox.com/s/hqmmf5wo6gpbq1b/rupx-bootstrap-160119.zip  >/dev/null 2>&1
echo download complete
wait
echo installing Unzip
sudo apt-get install unzip  >/dev/null 2>&1
wait
echo unzipping the bootstrap folders and files into the ~/.rupayacore directory
sudo unzip rupx-bootstrap-160119.zip -d ~/.rupayacore/  >/dev/null 2>&1
sudo chown -R rupxmn:rupxmn ~/.rupayacore/  >/dev/null 2>&1
echo Starting the Rupaya Daemon
rupayad -daemon
echo bootstrap installation complete!
exit
