# Generate a CA key - will ask for a passphrase
openssl genrsa -out ca.key 4096
# Generate the CA - will ask for various details, defaults all fine
openssl req -new -x509 -days 365 -key ca.key -sha256 -out ca.crt -subj "/C=US/ST=CA/L=San Francisco/O=Castle Intelligence, Inc."
