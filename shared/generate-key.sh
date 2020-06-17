mkdir ssl
cd ssl || exit
# Generate a key for the server certificate
openssl genrsa -out server.key 4096
# Generate a certificate signing request
openssl req -subj "/C=US/ST=CA/L=San Francisco/O=Castle Intelligence, Inc./CN=$HOST" -sha256 -new -key server.key -out server.csr
# Generate a server certificate w/ appropriate options - will ask for passphrase
echo "subjectAltName = IP:$IP" > extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ../ca.crt -CAkey ../ca.key -CAcreateserial -out server.crt -extfile extfile.cnf
# Combine key and certificate for stunnel server
cp server.crt ../redis.crt
cp server.key ../redis.key
cd .. || exit
rm -rf ssl
