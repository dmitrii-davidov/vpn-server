rm ./cert

URL=anabatik-vpn.westeurope.cloudapp.azure.com

./easy-rsa-ipsec/easyrsa3/easyrsa init-pki
./easy-rsa-ipsec/easyrsa3/easyrsa build-ca nopass
./easy-rsa-ipsec/easyrsa3/easyrsa build-server-full $URL nopass
./easy-rsa-ipsec/easyrsa3/easyrsa build-client-full client1 nopass
./easy-rsa-ipsec/easyrsa3/easyrsa export-p12 client1 nopass

cp ./pki/ca.crt ./cert
cp ./pki/issued/$URL.crt ./cert
cp ./pki/private/$URL.key ./cert
cp ./pki/private/client1.p12 ./cert

sudo python -m SimpleHTTPServer 80
