
echo "***************************************************************"
echo "***************************************************************"
echo "*************** Seti Burn-in Install Script *******************"
echo "***************************************************************"
echo "***************************************************************"

echo "Enter Station Number"
read -p "Enter Station Number: " station_number
echo "Hostname will be setiburnin-$station_number"

sudo hostnamectl set-hostname "setiburnin-$station_number"

echo "127.0.1.1    $new_hostname" | sudo tee -a /etc/hosts
echo "Hostname updated to $new_hostname"

echo "Copying desktop shortcut"
cp seti-burnin.desktop ~/Desktop/seti-burnin.desktop
sudo chmod a+x ~/Desktop/seti-burnin.desktop

# sudo chmod a+x get-docker.sh
# ./get-docker.sh


