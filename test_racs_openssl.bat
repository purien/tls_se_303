@echo off 
openssl s_client -tls1_2   -CAfile root.pem  -connect  127.0.0.1:7777 -ciphersuites TLS_AES_128_GCM_SHA256  -no_ticket -cert client.pem -key clientkey.pem -pass pass:pascal 
PAUSE 
