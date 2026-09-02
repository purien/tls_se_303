@echo off
set PORT=8888 
set SEN=key1.com
set IP=127.0.0.1
set nb=010
set V256=1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
REM
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
set id=Client_identity
REM  echo 256 characters
tlsse -c  -H @%nb%?01%V256% -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM  echo 512 characters
tlsse -c  -H @%nb%?01%V256%%V256% -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM  echo 128 bytes hexa coded
tlsse -c  -H @%nb%?FF%V256% -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
PAUSE