@echo off
set IP=127.0.0.1
set PORT=8888
set SN=key1.com
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
set ID=Client_identity
REM
openssl s_client -connect %IP%:%PORT% -servername %SN% -psk_identity %ID%  -psk %PSK% -tls1_3  -groups P-256 -cipher DHE -ciphersuites  TLS_AES_128_CCM_SHA256 -no_ticket
PAUSE