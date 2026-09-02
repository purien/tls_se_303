@echo off
set IP=127.0.0.1
set PORT=8888
set SEN=key1.com
REM
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
set id=Client_identity
SET  V32=1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
REM
tlsse -c -H #?A2%PSK% -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
tlsse -c -H #?D0%V32% -H #?D1%V32%  -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
PAUSE