#!/bin/bash
echo stopping the Rupaya daemon
rupaya-cli stop
wait
echo deleting the old folders and files from the ~/.rupayacore directory
rm -rf ~/.rupayacore/backups ~/.rupayacore/blocks ~/.rupayacore/chainstate ~/.rupayacore/database ~/.rupayacore/sporks ~/.rupayacore/zerocoin >/dev/null 2>&1
rm ~/.rupayacore/*.log ~/.rupayacore/*.dat ~/.rupayacore/.lock ~/.rupayacore/rupayad.pid >/dev/null 2>&1
wait
echo downloading the new bootstrap files
wget https://www.dropbox.com/s/hqmmf5wo6gpbq1b/rupx-bootstrap-160119.zip  >/dev/null 2>&1
echo download complete
wait
echo installing unzip
sudo apt-get install unzip  >/dev/null 2>&1
wait
echo unzipping the bootstrap into the rupaya folder
sudo unzip rupx-bootstrap-160119.zip -d ~/.rupayacore/  >/dev/null 2>&1
sudo chown -R rupxmn:rupxmn ~/.rupayacore/ >/dev/null 2>&1
echo Starting the Rupaya daemon
rupayad -daemon
echo The bootstrap update is now complete!
exit
