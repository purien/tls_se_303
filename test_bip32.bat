@echo off
set SEN=key1.com
set IP=127.0.0.1
set PORT=8888
REM
set PSK=0102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F20
set id=Client_identity
REM
set seed=f0acfacf9279b18275f6923a1f2d2c2be622e39e7bda9ed6d8a783f200b4a011793df8cde50014b5d8716971221dc7c63e6ff4e22128efa314b4c32fc07e76ae
REM //m/0’/1’/2’/3’
set path=80000000800000018000000280000003
REM 
tlsse -c -H #c38 -H #t38%seed%     -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
tlsse -c -H #b00%path%     -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
tlsse -c -H #p00           -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
echo Refx: 0282e66e0390200bf7264f7a3c02ed24767baeeda9d9205c171577aaf155d3cb32
tlsse -c -H #r00           -H #?02 -S  %SEN% -s -p %PORT% -h  %IP% -l TLS13-AES128-CCM-SHA256 -H psk%PSK% -H identity%id%
REM
PAUSE