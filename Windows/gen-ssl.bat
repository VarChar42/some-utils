@echo off


set /p CN=Enter CN: 
set /p DOMAIN=Enter domain name: 
set /p CA_PW=Enter CA password: 



set CN_STR="/CN=%CN%"


openssl genrsa -aes256 -passout pass:%CA_PW% -out ca-key.pem 4096 
openssl req -new -x509 -sha256 -passin pass:%CA_PW% -subj %CN_STR% -days 365 -key ca-key.pem -out ca.pem


openssl genrsa -out cert-key.pem 4096

openssl req -new -sha256 -subj %CN_STR% -passin pass:%CA_PW% -key cert-key.pem -out cert.csr

echo subjectAltName=DNS:%DOMAIN%,DNS:*.%DOMAIN% >> extfile.cnf

openssl x509 -req -sha256 -passin pass:%CA_PW% -days 365 -in cert.csr -CA ca.pem -CAkey ca-key.pem -out cert.pem -extfile extfile.cnf -CAcreateserial