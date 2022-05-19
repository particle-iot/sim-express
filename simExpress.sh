#!/bin/bash
echo "Welcome to the Particle SIM Express Tool!\n"
read -p 'Please tell me the filename of your ICCID list (e.g. iccids.txt): ' devicelist
echo "....."
read -p 'What is the Product ID (e.g. 1234): ' productID
echo "....."
read -p 'Now, what is the Product Token (e.g. 123445566777): ' token
echo "....."
read -p 'Lastly, do you want to deactivate or reactivate your list of ICCIDS (deactivate or reactivate): ' action
echo "....."
echo "Thank you, please standby while I get to work!"

cat $devicelist | while read sim || [[ -n $sim ]];
do
DEACTIVATE=$(
   curl -X PUT https://api.particle.io/v1/products/$productID/sims/$sim \
       -d action=$action \
       -d access_token=$token)

echo -e "\nParticle SIM Express is now going to $action SIM: $sim"
done
