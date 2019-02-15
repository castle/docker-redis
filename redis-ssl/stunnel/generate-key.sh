mkdir ssl
cd ssl || exit
# Generate a CA key - will ask for a passphrase
openssl genrsa -out ca-key.pem 4096
# Generate the CA - will ask for various details, defaults all fine
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem -subj "/C=US/ST=CA/L=San Francisco/O=Castle Intelligence, Inc."
# Generate a key for the server certificate
openssl genrsa -out server-key.pem 4096
# Generate a certificate signing request
openssl req -subj "/C=US/ST=CA/L=San Francisco/O=Castle Intelligence, Inc./CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
# Generate a server certificate w/ appropriate options - will ask for passphrase
echo "subjectAltName = IP:$HOST" > extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf
# Combine key and certificate for stunnel server
cat server-key.pem server-cert.pem > ../rediscert.pem
cd .. || exit
rm -rf ssl
