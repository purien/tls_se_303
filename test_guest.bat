@echo off
set IP=127.0.0.1
set PORT=8888
set SEN=key1.com
REM
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
set id=Client_identity
REM
tlsse -c -H #?AA%PSK%%PSK%  -H #?A0%PSK%  -H #?A1  -H #?05Client_identity -H#?06guest -H #?A80507  -H #?A501  -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
set id=guest
tlsse -c -H #?00 -H #?FFabcd -H #?02  -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
set id=Client_identity
tlsse -c -H #?A80503 -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
set id=guest
tlsse -c -H #?FFabcd -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
set id=Client_identity
tlsse -c -H #?A500 -H #?A80507 -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
set id=guest
tlsse -c -H #?00 -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
PAUSE